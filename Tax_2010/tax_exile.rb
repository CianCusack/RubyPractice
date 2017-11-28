require_relative 'tax_payer'
class TaxExile < TaxPayer
  def initialize name, yearly_salary, credit
    super
  end

  def calculate_tax
    0
  end
end