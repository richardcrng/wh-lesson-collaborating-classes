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

  def students
    courses.map { |course| course.students }.flatten.uniq
  end

  def self.all
    @@all
  end
end