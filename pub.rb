class Pub

  attr_reader :name
  attr_accessor :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end


  def give_drink(requested_name, drinks, customer)

    if customer.customer_age > 18 && customer.customer_alcohol_level < 10
      for drink in drinks
        if requested_name == drink.drink_name
          customer.customer_hand.push(drink)
          @till += drink.drink_price
          customer.customer_wallet -= drink.drink_price
          customer.customer_alcohol_level += drink.alcohol
        end
      end

      drink_to_delete = drinks.pop()

      for drink in drinks
        if drink_to_delete == drink
          drinks.delete(drink)
        end
      end
    elsif customer.customer_alcohol_level > 10
      return "You're too drunk!"
    else
      return "You're too young, pal"
    end
    return "No got that drink, pal"
  end



end
