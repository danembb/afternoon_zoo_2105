class Animal
  attr_reader :kind,
              :weight,
              :age,
              :age_in_days

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight.to_s + " pounds"
    @age = age.to_s + " weeks"
    @age_in_days = age * 7
  end


  def feed!(weight_of_food)
    @weight += weight_of_food.to_i
  end
end

# Would this be the preferred way of dealing with changing the integer
# to a string to suit the tests needs? Is this making it more complicated
# than it needs to be? I was planning on implementing an animal.weight_conversion
# in the actual interaction pattern.

  # def weight_conversion
  #   animal.weight.to_s + " pounds"
  # end
  #
  # def age_conversion
  #   animal.age.to_s + " pounds"
  # end
