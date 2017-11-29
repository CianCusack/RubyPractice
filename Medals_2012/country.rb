class Country
  attr_reader :gold, :population, :country, :silver, :bronze
  def initialize country, gold, silver, bronze, pop
    @country, @gold, @silver, @bronze, @population = country, gold, silver, bronze, pop
  end

  def to_s
    "#{@country}, #{@gold}, #{@silver}, #{@bronze}, #{@population}"
  end

  def ranking
    ((@gold*3 + @silver*2 + @bronze).to_f / @population)
  end
end