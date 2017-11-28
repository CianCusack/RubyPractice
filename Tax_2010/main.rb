require_relative 'population'
require_relative 'tax_exile'

tax_payer = TaxPayer.new('John', 60000, 5000)

puts tax_payer.to_s

population = Population.new
filename = 'population.txt'
begin
  if File.empty? filename
    abort "#{filename} is empty!"
  end
  IO.foreach(filename) do |line|
    data = line.split
    name = data[0]
    salary = data[1].to_f
    credit = data[2].to_f
    if name == "Sean"
      population.add_tax_payer TaxExile.new(name, salary, credit)
    else
      population.add_tax_payer TaxPayer.new(name, salary, credit)
    end
  end
rescue abort("error reading #{filename}")
end

puts population.to_s

puts '***** Sorting *****'

population.sort_population_ascending
puts population.to_s
