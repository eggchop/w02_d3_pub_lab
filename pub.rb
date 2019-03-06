class Pub
  attr_reader :name,:drinks, :till
  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def take_drink_from_stock(drink)
    return @drinks.delete(drink)
  end

end