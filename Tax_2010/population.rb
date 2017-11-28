require_relative 'tax_payer'

class Population
  def initialize
    @tax_payers = []
  end

  def add_tax_payer tax_payer
    @tax_payers << tax_payer
  end

  def total_tax_due
    total = 0
    @tax_payers.each do |payer|
      total += payer.calculate_tax
    end
    total
  end

  def percentage_paying_no_tax
    number_on_zero_tax = 0.0
    @tax_payers.each do |payer|
      if payer.calculate_tax == 0
        number_on_zero_tax += 1
      end
    end
    (number_on_zero_tax/@tax_payers.size )* 100
  end

  def sort_population_ascending
    @tax_payers.sort!
  end

  def to_s
    str = ''
    @tax_payers.each do |payer|
      str += payer.to_s + "\n"
    end
    str += "Total tax due for population is : €#{total_tax_due}\n"
    str += "Percentage of population paying no tax is #{percentage_paying_no_tax}%\n"
  end
end