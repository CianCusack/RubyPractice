require 'test/unit'
require_relative '../medal_rankings'
require_relative '../country'

class MedalRankingsTest < Test::Unit::TestCase

  def setup
    country = Country.new('IRL', 1,1,1,1000)
    country1 = Country.new('GBR', 2,1,1,1000)
    @rankings = MedalRankings.new
    @rankings.add_country country
    @rankings.add_country country1
  end

  def test_to_s
    str = "IRL, 1, 1, 1, 1000\nGBR, 2, 1, 1, 1000\n"
    assert_equal(str, @rankings.to_s, 'Incorrect to_s method')
  end

  def test_most_golds
    assert_equal("GBR", @rankings.most_golds, 'Incorrect most golds')
  end

  def test_total_pop
    assert_equal(2000, @rankings.total_pop, 'Incorrect total population')
  end

  def test_sort
    @rankings.sort!
    str = "GBR, 2, 1, 1, 1000\nIRL, 1, 1, 1, 1000\n"
    assert_equal(str, @rankings.to_s, 'Incorrect to_s method')
  end

end