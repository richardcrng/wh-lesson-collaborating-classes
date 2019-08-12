class Cohort
  attr_accessor :students, :courses

  @@all = []

  def initialize(arr_of_students)
    @students = arr_of_students
    @courses = []
    @@all << self
  end

  def add_student(student)
    students << student
  end

  def assign_course(course)
    courses << course
  end

  def self.all
    @@all
  end

end