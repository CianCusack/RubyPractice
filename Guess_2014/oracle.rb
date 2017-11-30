class Oracle
  def initialize range
    @secret_number = rand(range)
  end

  def is_it? guess
    if @secret_number == guess
      return true
    end
    if @secret_number < guess
      return false, :less
    end
    if @secret_number > guess
      return false, :greater
    end
  end

end