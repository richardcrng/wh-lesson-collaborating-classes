class Course
  attr_accessor :labs

  @@all = []

  def initialize(labs_arr = [])
    @labs = labs_arr
    @@all << self
  end

  def add_lab(lab)
    labs << lab
  end

  def cohorts
    Cohort.all.select { |cohort| cohort.courses.include?(self) }
  end

  def completed_by_student?(student)
    labs.all? { |lab| lab.completed_by_student?(student) }
  end

  def student_completion
    students.reduce({}) do |acc, student|
      acc[student.object_id] = completed_by_student?(student)
      acc
    end
  end

  def students
    cohorts.map { |cohort| cohort.students }.flatten.uniq
  end

  def self.all
    @@all
  end

end