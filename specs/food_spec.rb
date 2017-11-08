require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class Testfood < Minitest::Test

  def setup
    @food_name = "Taco"
    @food_price = 2
    @rejuvenation_level = 1
    @food1 = Food.new(@food_name, @food_price, @rejuvenation_level)
  end


  def test_food_name
    assert_equal("Taco", @food1.food_name)
  end

  def test_food_price
    assert_equal(2, @food1.food_price)
  end

  def test_rejuvenation_level
    assert_equal(1, @food1.rejuvenation_level)
  end

end
