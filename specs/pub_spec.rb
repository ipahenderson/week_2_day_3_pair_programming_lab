require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')
require_relative('../food.rb')


class TestPub < Minitest::Test

  def setup
    @name = "The Red Lion"
    @till = 0
    @vodka = Drink.new("Vodka Coke", 2, 4)
    @babycham = Drink.new("Babycham", 3, 9)
    @lager = Drink.new("Lager", 1, 5)
    @whisky= Drink.new("Whisky", 4, 6)
    @drinks = [@vodka, @babycham, @lager, @whisky]
    @pub = Pub.new(@name, @till, @drinks)
    @melvin = Customer.new("Melvin", 20, 30, 0)
    @billy = Customer.new("Billy", 5, 17, 10)
    @sam = Customer.new("Sam", 5, 90, 50)
    @taco = Food.new("Taco", 2, 1)

    @drink_stock = [
      {
        drink: @vodka,
        stock: 5
      },

      {
        drink: @babycham,
        stock: 10
      },

      {
        drink: @lager,
        stock: 15
      },

      {
        drink: @whisky,
        stock: 20
      }
    ]
  end

  def test_pub_name
    assert_equal("The Red Lion", @pub.name)
  end

  def test_customer_name
    assert_equal("Melvin", @customer.customer_name)
  end

  def test_drink_name
    assert_equal("Vodka Coke", @vodka.drink_name)
  end


  def test_give_drink
    @pub.give_drink(@vodka.drink_name, @drinks, @melvin, @pub)
    result1 = @melvin.customer_hand.size
    assert_equal(1, result1)
  end

  def test_give_money
    @pub.give_drink(@vodka.drink_name, @drinks, @melvin, @pub)
    result1 = @melvin.customer_wallet
    result2 = @pub.till
    assert_equal(18, result1)
    assert_equal(2, result2)
  end


  def test_customer_age
    result = @billy.id_customer(@billy)
    assert_equal(false, result)
  end


  def test_alcohol_level
    @pub.give_drink(@vodka.drink_name, @drinks, @melvin, @pub)
    result = @melvin.customer_alcohol_level
    assert_equal(4, result)
  end


  def test_sober_up
    @sam.sober_up(@sam, @taco)
    result = @sam.customer_alcohol_level
    assert_equal(49, result)
  end


  def test_stock_of_drink
    result = @pub.stock_of_drink("Vodka Coke", @drink_stock)
    assert_equal(5, result)
  end


  def test_total_stock
    result = @pub.total_stock(@drink_stock)
    assert_equal(50, result)
  end


  def test_food_name
    assert_equal("Taco", @taco.food_name)
  end


  def test_food_price
    assert_equal(2, @taco.food_price)
  end


  def test_rejuvenation_level
    assert_equal(1, @taco.rejuvenation_level)
  end


end
