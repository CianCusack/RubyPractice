class MedalRankings
  def initialize
    @countries = []
  end

  def add_country country
    @countries << country
  end

  def to_s
    str = ''
    @countries.each() do |country|
      str += country.to_s + "\n"
    end
    str
  end

  def most_golds
    most = @countries.max{|country| country.gold}
    most.country
  end

  def sort!
    @countries.sort! {|c, c1| c.ranking <=> c1.ranking}.reverse!
  end

  def total_pop
    @countries.inject(0) {|total, country| total+country.population}
  end

  def each_medal_winner
    @countries.each do |country|
      if country.gold > 0 || country.silver > 0 || country.bronze > 0
        yield country
      end
    end
  end
end