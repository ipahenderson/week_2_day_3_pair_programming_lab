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

  #  def id_customer(customer)
  #    if customer.customer_age > 18
  #      return true
  #    else
  #      return "You're too young, pal"
  #    end
  #  end

end
