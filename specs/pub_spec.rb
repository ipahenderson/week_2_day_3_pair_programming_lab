require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')



class TestPub < Minitest::Test

  def setup
    @name = "The Red Lion"
    @till = 0
    @drink1 = Drink.new("Vodka Coke", 2, 4)
    @drink2 = Drink.new("Babycham", 3, 9)
    @drink3 = Drink.new("Lager", 1, 5)
    @drink4 = Drink.new("Whisky", 4, 6)
    @drinks = [@drink1, @drink2, @drink3, @drink4]
    @pub = Pub.new(@name, @till, @drinks)
    @customer_name = "Melvin"
    @customer_wallet = 20
    @customer_age = 30
    @customer_alcohol_level = 0
    @customer1 = Customer.new(@customer_name, @customer_wallet, @customer_age, @customer_alcohol_level)
    @customer_name2 = "Billy"
    @customer_wallet2 = 5
    @customer_age2 = 17
    @customer_alcohol_level2 = 10
    @customer2 = Customer.new(@customer_name2, @customer_wallet2, @customer_age2, @customer_alcohol_level2)
    @customer_name3 = "Sam"
    @customer_wallet3 = 5
    @customer_age3 = 90
    @customer_alcohol_level3 = 50
    @customer3 = Customer.new(@customer_name3, @customer_wallet3, @customer_age3, @customer_alcohol_level3)
  end

  def test_pub_name
    assert_equal("The Red Lion", @pub.name)
  end

  def test_give_drink
      @pub.give_drink("Vodka Coke", @drinks, @customer1)
      result1 = @customer1.customer_hand.size
      result2 = @drinks.size
      assert_equal(1, result1)
      assert_equal(3, result2)
  end

  def test_give_money
      @pub.give_drink("Vodka Coke", @drinks, @customer1)
      result1 = @customer1.customer_wallet
      result2 = @pub.till
      assert_equal(18, result1)
      assert_equal(2, result2)
  end

  def test_customer_age
    result = @pub.give_drink("Vodka Coke", @drinks, @customer2)
    assert_equal("You're too young, pal", result)
  end


  def test_alcohol_level
    @pub.give_drink("Vodka Coke", @drinks, @customer1)
    result = @customer1.customer_alcohol_level
    assert_equal(4, result)
  end

  def test_drunkeness
  result = @pub.give_drink("Vodka Coke", @drinks, @customer3)
  phrase = "You're too drunk!"
  assert_equal(phrase, result)
  end




end
