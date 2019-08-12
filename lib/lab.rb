class Lab
  attr_accessor :title, :description

  @@all = []

  def initialize(title, description = nil)
    @title = title
    @description = description
    @@all << self
  end

  def courses
    Course.all.select { |course| course.labs.include?(self) }
  end

  def student_completion
    self.students.reduce({}) do |acc, student|
      acc[student.object_id] = student.completed_labs.include?(self)
      acc
    end
  end

  def students
    courses.map { |course| course.students }.flatten.uniq
  end

  def self.all
    @@all
  end
end