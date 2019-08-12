class Student
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def cohort
    Cohort.all.find { |cohort| cohort.students.include?(self) }
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