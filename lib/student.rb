class Student
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end
end