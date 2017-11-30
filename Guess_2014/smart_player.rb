require_relative 'player'
require_relative 'oracle'

class SmartPlayer < Player
  def initialize name, oracle, range
    super
  end

  def guess
    @num_guesses += 1
    guess = ((@range.begin+@range.end)/2).to_i
    puts "Range is: #{@range}"
    puts "#{@name} guessed #{guess}"
    correct, comment = @oracle.is_it? guess
    if correct
      puts "#{@name} guessed #{guess} and won"
      return true
    else
      if comment == :less
        @range = (@range.begin..guess)
      else
        @range = (guess..@range.end)
      end
    end
    false
  end
end