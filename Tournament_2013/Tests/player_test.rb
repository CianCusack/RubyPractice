require 'test/unit'
require_relative '../player'

class PlayerTest < Test::Unit::TestCase

  def setup
    @player = Player.new('Cian', 2000, [1, 1, 1, 1])
  end

  def test_total
    assert_equal(4, @player.total, 'Incorrect player total')
  end

  def test_to_s
    str = "Cian 2000 1 1 1 1 Total: 4\n"
    assert_equal(str, @player.to_s, 'Incorrect player to_s method')
  end
end