require_relative 'card'

card = Card.new('hearts', 'jack')
puts card.to_s

kinds = ['ace', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'jack', 'queen', 'king']
suits = ['hearts', 'diamonds', 'spades', 'clubs']

i = 0
while true
  i+=1
  random_suit = rand(3)
  random_kind = rand(12)
  #card = Card.new(suits[random_suit], kinds[random_kind])
  if suits[random_suit] == 'hearts' and  kinds[random_kind] == 'jack'
    break
  end
end

puts "Found JACK of HEARTS after #{i} attempts"
cards = []
suits.each() do |suit|
  kinds.each() do |kind|
    cards << Card.new(suit, kind)
  end
end


i = 0
while true
  i+=1
  pack = Pack.new(cards)
  card_1 = pack.pick_random
  card_2 = pack.pick_random
  card_3 = pack.pick_random
  if card_1.kind == 'four' and card_2.kind == 'four' and card_3.kind == 'four'
    puts "Found three FOURS after #{i} attempts"
    puts card_1.to_s
    puts card_2.to_s
    puts card_3.to_s
    break
  end
end
pack = Pack.new cards
hand_1 = Hand.new
hand_2 = Hand.new
hand_3 = Hand.new
hand_4 = Hand.new
hand_1.add pack.deal_hand
hand_2.add pack.deal_hand
hand_3.add pack.deal_hand
hand_4.add pack.deal_hand
puts 'Hand 1'
puts hand_1.to_s
puts 'Hand 2'
puts hand_2.to_s
puts 'Hand 3'
puts hand_3.to_s
puts 'Hand 4'
puts hand_4.to_s

puts "\n********Sorting********\n\n"
hands = [hand_1, hand_2, hand_3, hand_4]
hands.sort! { |h, h1| h <=> h1}
hands.each {|h| puts h.to_s }
