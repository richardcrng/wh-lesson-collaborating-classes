class Lab
  attr_accessor :title, :description

  @@all = []

  def initialize(title, description = nil)
    @title = title
    @description = description
    @@all << self
  end

  def completed_by_student?(student)
    student.completed_labs.include?(self)
  end

  def courses
    Course.all.select { |course| course.labs.include?(self) }
  end

  def student_completion
    students.reduce({}) do |acc, student|
      acc[student.object_id] = completed_by_student?(student)
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