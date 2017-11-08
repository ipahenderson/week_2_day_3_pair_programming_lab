class Customer

  attr_reader :customer_name, :customer_age
  attr_accessor :customer_wallet, :customer_hand, :customer_alcohol_level

   def initialize(customer_name, customer_wallet, customer_age, customer_alcohol_level)
     @customer_name = customer_name
     @customer_wallet = customer_wallet
     @customer_hand = []
     @customer_age = customer_age
     @customer_alcohol_level = customer_alcohol_level
   end


   def give_money(drink, customer, pub)
     pub.till += drink.drink_price
     customer.customer_wallet -= drink.drink_price
   end

   def get_drunk(drink, customer)
     customer.customer_alcohol_level += drink.alcohol
   end

  def sober_up(customer, food)
    customer.customer_alcohol_level -= food.rejuvenation_level
  end

   def id_customer(customer)
     customer.customer_age > 18 ? true : false
   end

end
