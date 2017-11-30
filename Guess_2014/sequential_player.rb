require_relative 'player'
class SequentialPlayer < Player
  def initialize name, oracle, range
    super
  end

  def guess
    @range.each do |i|
      @num_guesses += 1
      if @oracle.is_it?(i) == true
        puts "#{@name} guessed #{i} and won"
        return true
      else
        puts "#{@name} guessed #{i}"
      end
    end
  end
end