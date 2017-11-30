require_relative 'player'
require_relative 'Tournament'

tournament = Tournament.new
begin
  if File.empty? 'tournament.txt'
    abort 'tournament.txt is empty!'
  end
  IO.foreach('tournament.txt') do |line|
    data = line.split
    name = data[0]
    rating = data[1].to_i
    results_as_string_array = data[2..data.size].to_a
    results_int_array = results_as_string_array.map(&:to_i)
    tournament.add_player(Player.new(name, rating, results_int_array))
  end
rescue abort('error reading tournament.txt')
end

puts tournament.to_s

puts '******Sorting******'

tournament.sort!

puts tournament.to_s

puts tournament.check_consistency

tournament.elo_rating

puts "******New Ratings******"
puts tournament.to_s