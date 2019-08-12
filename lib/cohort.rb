class Cohort
  attr_accessor :students

  @@all = []

  def initialize(arr_of_students)
    @students = arr_of_students
    @@all << self
  end

  def add_student(student)
    students << student
  end

  def self.all
    @@all
  end

end