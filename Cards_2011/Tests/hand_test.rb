require 'test/unit'
require_relative '../card'

class HandTest < Test::Unit::TestCase

  def setup
    kinds = ['ace', 'two', 'three']
    suits = ['hearts', 'diamonds']
    cards = []
    suits.each() do |suit|
      kinds.each() do |kind|
        cards << Card.new(suit, kind)
      end
    end
    pack = Pack.new cards
    @hand = Hand.new
    @hand.add pack.deal_hand
  end

  def test_rank
    assert_true(@hand.rank > 0, 'Incorrect rank')
  end

end