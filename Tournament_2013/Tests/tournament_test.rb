require 'test/unit'
require_relative '../tournament'

class TournamentTest < Test::Unit::TestCase

  def setup
    @bill = Player.new 'Bill', 1000, [0, 0, 0, 0]
    @tournament = Tournament.new
    @tournament.add_player Player.new 'Cian', 2000, [1, 1, 1, 1]
    @tournament.add_player @bill
  end

  def test_average
    assert_equal(1500, @tournament.average, 'Incorrect average')
  end

  def test_average_opponent_rating
    assert_equal(2000, @tournament.average_opponents_rating(@bill), 'Incorrect average opponent rating')
  end

  def test_sort!
    str = "Average rating is: 1500\n"
    str += "Cian 2000 1 1 1 1 Total: 4\nBill 1000 0 0 0 0 Total: 0\n"
    assert_equal(str, @tournament.to_s)
    @tournament.sort!
    assert_equal(str, @tournament.to_s)
  end

  def test_elo_rating
    @tournament.elo_rating
    str = "Average rating is: 1499\n"
    str += "Cian 2000 1 1 1 1 Total: 4\nBill 999 0 0 0 0 Total: 0\n"
    assert_equal(str, @tournament.to_s)
  end

end