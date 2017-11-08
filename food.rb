class Food

  attr_reader :food_name, :food_price, :rejuvenation_level

  def initialize(food_name, food_price, rejuvenation_level)
    @food_name = food_name
    @food_price = food_price
    @rejuvenation_level = rejuvenation_level
  end

end
