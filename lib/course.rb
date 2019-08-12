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

  def self.all
    @@all
  end

end