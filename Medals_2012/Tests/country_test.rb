require 'test/unit'
require_relative '../country'

class CountryTest < Test::Unit::TestCase

  def setup
    @country = Country.new('IRL', 1,1,1,1000)
  end

  def test_to_s
    assert_equal('IRL, 1, 1, 1, 1000', @country.to_s, 'Incorrect to string')
  end

  def test_ranking
    assert_equal(0.006, @country.ranking, 'Incorrect rank method')
  end

end