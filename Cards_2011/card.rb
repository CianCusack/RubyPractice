class Card
  attr_reader :kind
  def initialize suit, kind
    @suit, @kind = suit, kind
  end

  def to_s
    str = "#{@kind.upcase} of #{@suit.upcase}"
  end
end

class SuperCard
  def initialize cards = []
    @cards = cards.dup
  end

  def add card
    @cards << card
  end

  def remove card
    @cards.delete(card)
  end

  def to_s
    str = ''
    @cards.each {|card| str+=card.to_s + "\n"}
    str
  end
end

class Pack < SuperCard
  def initialize cards
    super cards
  end

  def pick_random
    card = select_random_card
    remove(card)
    card
  end

  def deal_hand
    hand = []
    5.times do
      card = select_random_card
      hand << card
      remove(card)
    end
    hand
  end

  def select_random_card
    @cards[rand(@cards.size - 1)]
  end
end

class Hand < SuperCard
  include Comparable
  def initialize
    super
  end

  def add hand
    @cards = hand[0..4].dup
  end

  def rank
    best = 0
    @cards.each do |card|
      count = 0
      @cards.each do |card1|
        if(card1.kind == card.kind)
          count+=1
        end
      end
      if count > best
        best = count
      end
    end
    best-1
  end

  def <=> other
    rank <=> other.rank
  end

  def to_s
    super + rank.to_s

  end

end

