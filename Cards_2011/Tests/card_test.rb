require 'test/unit'
require_relative '../card'
class CardTest < Test::Unit::TestCase

  def setup
    @card = Card.new('spades', 'two')
  end

  def test_to_s
    assert_equal('TWO of SPADES', @card.to_s, 'Incorrect to string method')
  end
end