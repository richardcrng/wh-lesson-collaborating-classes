class Cohort
  attr_accessor :students

  def initialize(arr_of_students)
    @students = arr_of_students
  end

  def add_student(student)
    students << student
  end

end