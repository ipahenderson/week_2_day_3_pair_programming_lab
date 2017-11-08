require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test

  def setup
    @name = "The Red Lion"
    @till = 0
    @drink1 = Drink.new("Vodka Coke", 2)
    @drink2 = Drink.new("Babycham", 3)
    @drink3 = Drink.new("Lager", 1)
    @drink4 = Drink.new("Whisky", 4)
    @drinks = [@drink1, @drink2, @drink3, @drink4]
    @pub = Pub.new(@name, @till, @drinks)
    @customer_name = "Melvin"
    @customer_wallet = 20
    @customer_age = 17
    @customer = Customer.new(@customer_name, @customer_wallet, @customer_age)
  end


  def test_customer_name
    assert_equal("Melvin", @customer.customer_name)
  end

end
