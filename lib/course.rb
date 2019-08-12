class Course
  attr_accessor :labs

  def initialize(labs_arr)
    @labs = labs_arr.reduce({}) do |acc, val|
      acc[val.object_id] = val
      acc
    end
  end

end