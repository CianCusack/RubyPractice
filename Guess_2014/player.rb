class Player
  attr_reader :num_guesses
  def initialize name, oracle, range
    @name, @oracle, @range, @num_guesses = name, oracle, range, 0
  end

  def guess
  end

  def to_s
    "#{@name} guessed #{@num_guesses} times"
  end

end