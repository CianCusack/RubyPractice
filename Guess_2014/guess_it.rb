require_relative 'oracle'
require_relative 'random_player'
require_relative 'smart_player'
require_relative 'sequential_player'
class GuessIt
  def initialize
    @players = []
    play_game
  end

  def play_game
    oracle = Oracle.new(1..100)
    player = RandomPlayer.new 'Bill', oracle, 1..100
    player1 = SmartPlayer.new 'Cian', oracle, 1..100
    player2 = SequentialPlayer.new 'Chris', oracle, 1..100
    @players = [player, player1, player2]
    @players.each do |player|
      until player.guess

      end
    end
    sort!
    @players.each do |player|
      puts player.to_s
    end
  end

  def sort!
    @players.sort_by! { |player| player.num_guesses}.reverse!
  end
end