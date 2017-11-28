require 'test/unit'
require_relative '../tax_payer'

class TaxPayerTest < Test::Unit::TestCase

  def setup
    @tax_payer = TaxPayer.new('Cian', 10000, 1000)
  end

  def test_to_s
    assert_equal('Cian with annual salary of €10000 owes €1000.0 in tax', @tax_payer.to_s, 'To string not working')
  end

  def test_calculate_tax
    assert_equal(1000.0, @tax_payer.calculate_tax, 'Incorrect tax calculation')
  end

  def test_comparators
    other = TaxPayer.new('Chris', 5000, 500)
    assert_true(@tax_payer > other, 'Incorrect > comparator')
    assert_false(@tax_payer < other, 'Incorrect < comparator')
    assert_true(@tax_payer >= other, 'Incorrect >= comparator')
    assert_false(@tax_payer <= other, 'Incorrect <= comparator')
    assert_false(@tax_payer == other, 'Incorrect == comparator')
    assert_true(@tax_payer != other, 'Incorrect != comparator')
  end

end