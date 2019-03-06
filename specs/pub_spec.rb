require("minitest/autorun")
require("minitest/rg")

require_relative("../pub")
require_relative("../drink")
require_relative("../customer")
require_relative("../food")

class PubTest < MiniTest::Test

  def setup
    @food1 = Food.new('Hot Dog', 5, 4)
    @food2 = Food.new('Burger', 12, 6)
    @food3 = Food.new('Nachos', 4, 3)
    @food = [@food1,@food2,@food3]
    @drink1 = Drink.new('Dead Pony Club', 6, 7)
    @drink2 = Drink.new('Corona', 3, 3)
    @drink3 = Drink.new('Tenants', 4, 5)
    @drink4 = Drink.new('Nice Ale', 5, 8)
    @drinks = [@drink1,@drink2,@drink3,@drink4]
    @pub = Pub.new('The Stables', 50, @drinks)
    @customer1 = Customer.new('Sally', 15, 17)
  end

  def test_get_pub_name
    assert_equal('The Stables', @pub.name)
  end

  def test_get_till_amount
    assert_equal(50, @pub.till)
  end

  def test_get_drinks_number
    assert_equal(4, @pub.drinks.count)
  end

  def test_take_drink_from_pub
    result = @pub.take_drink_from_stock(@drink3)
    assert_equal(@drink3, result)
  end

  def test_add_money_to_till
    result = @pub.add_money_to_till(@drink2)
    assert_equal(53, result)
  end

  def test_get_food_array
    assert_equal(0, @pub.food.count)
  end

  def test_add_food_to_pub
    assert_equal(0, @pub.food.count)
    @pub.add_food_to_pub(@food)
    assert_equal(3, @food.count)
  end

  def test_take_food_from_pub
    @pub.add_food_to_pub(@food)
    result = @pub.take_food_from_pub(@food2)
    assert_equal(@food2, result)
  end

end
