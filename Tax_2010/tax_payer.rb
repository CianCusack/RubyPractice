
class TaxPayer
  include Comparable
  UPPER_LIMIT = 34000
  LOWER_RATE = 0.2
  UPPER_RATE = 0.41
  def initialize name, yearly_salary, credit
    @name, @salary, @tax_credit = name, yearly_salary, credit
  end

  def calculate_tax
    tax_due = 0
    if @salary > UPPER_LIMIT
      tax_due += calculate_upper_limit_of_tax
      tax_due += calculate_lower_limit_of_tax UPPER_LIMIT
    else
      tax_due += calculate_lower_limit_of_tax @salary
    end
    deduct_tax_credits tax_due
  end

  def calculate_upper_limit_of_tax
    (@salary-UPPER_LIMIT)*UPPER_RATE
  end

  def calculate_lower_limit_of_tax salary
    salary * LOWER_RATE
  end

  def deduct_tax_credits tax
    (tax-@tax_credit) >= 0 ? tax-@tax_credit : 0
  end

  def <=> other
    calculate_tax <=> other.calculate_tax
  end

  def to_s
    "#{@name} with annual salary of €#{@salary} owes €#{calculate_tax} in tax"
  end

end