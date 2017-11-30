class Tournament
  def initialize
    @players = []
  end

  def add_player player
    @players << player
  end

  def average
    @players.inject(0) { |total, player| total + player.rating} / @players.size
  end

  def average_opponents_rating player
    total = ((@players.inject(0) { |total, player| total + player.rating}) - player.rating) / (@players.size - 1)
  end

  def elo_rating
    new_ratings = []
    @players.each_with_index do |player, i|
      power = ((average_opponents_rating(player) - player.rating) / 400.0)
      e = 1 / (1 + (10 ** power))
      r = player.rating + (40 * (player.total - (player.results.size * e)))
      new_ratings[i] = r.to_i
    end
    @players.zip(new_ratings) do |player, rating|
      player.rating = rating
    end
  end

  def sort!
    @players.sort_by! { |player| player.total }.reverse!
  end

  def check_consistency
    average_games_player = @players.inject(0) { |total, player| total + player.results.size} / @players.size
    if @players.size != average_games_player + 1
      return false
    end
    num_wins_total = @players.inject(0) { |total, player| total + player.total}
    if num_wins_total * 2 != @players.size * average_games_player
      return false
    end
    true
  end

  def to_s
    str = 'Average rating is: ' + average.to_s + "\n"
    @players.each do |player|
      str += player.to_s
    end
    str
  end
end