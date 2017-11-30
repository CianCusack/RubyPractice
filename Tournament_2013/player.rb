class Player
  attr_reader :results
  attr_accessor :rating
  def initialize name, rating, results
    @name, @rating, @results = name, rating, results
  end

  def total
    @results.inject(0) { |total, result| total + result }
  end

  def to_s
    str = "#{@name} #{@rating} "
    @results.each do |result|
      str += result.to_s + " "
    end
    str += "Total: "+ total.to_s + "\n"
  end

end