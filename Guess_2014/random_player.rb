require_relative 'player'

class RandomPlayer < Player
  def initialize name, oracle, range
    super
  end

  def guess
    @num_guesses += 1
    guess = rand(@range)
    if @oracle.is_it?(rand(guess)) == true
      puts "#{@name} guessed #{guess} and won"
      return true
    else
      puts "#{@name} guessed #{guess}"
      false
    end
  end
end