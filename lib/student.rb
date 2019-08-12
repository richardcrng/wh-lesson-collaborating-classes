class Student
  attr_accessor :first_name, :last_name, :completed_labs

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @completed_labs = []
    @@all << self
  end

  def cohort
    Cohort.all.find { |cohort| cohort.students.include?(self) }
  end

  def complete_lab(lab)
    completed_labs << lab unless completed_labs.include?(lab)
  end

  def labs
    cohort.courses.map { |course| course.labs }.flatten.uniq
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end
end