require 'test/unit'
require_relative '../card'

class PackTest < Test::Unit::TestCase

  def setup
    kinds = ['ace', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'jack', 'queen', 'king']
    suits = ['hearts', 'diamonds', 'spades', 'clubs']
    cards = []
    suits.each() do |suit|
      kinds.each() do |kind|
        cards << Card.new(suit, kind)
      end
    end
    @pack = Pack.new cards
  end

  def test_pick_random
    card = @pack.pick_random
    assert_true(card.instance_of?(Card), 'Picked card not a card')
  end

  def test_deal_hand
    hand = @pack.deal_hand
    assert_true(hand.size.equal?(5), 'Hand is the wrong size')
    hand.each do |card|
      assert_true(card.instance_of?(Card), 'Card in hand is not a card')
    end
  end

end