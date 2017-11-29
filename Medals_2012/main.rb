
require_relative 'country'
require_relative 'medal_rankings'

rankings = MedalRankings.new
begin
  if File.empty? 'medals.txt'
    abort 'medals.txt is empty!'
  end
  IO.foreach('medals.txt') do |line|
    data = line.split
    name = data[0]
    gold = data[1].to_i
    silver = data[2].to_i
    bronze = data[3].to_i
    population = data[4].to_i
    rankings.add_country(Country.new(name, gold, silver, bronze, population))
  end
rescue abort('error reading medals.txt')
end
puts 'Here is medals table in its original order: '
puts rankings.to_s
puts rankings.most_golds + " won the most gold medals"
puts "Total population is: " + rankings.total_pop.to_s

rankings.sort!
puts 'Here is medals table ordered on ranking: '
puts rankings.to_s
sum = 0
i=0
rankings.each_medal_winner do |country|
  sum += country.population
  i+=1
end
puts "Average population of medal-winning countries is " + (sum/i).to_i.to_s