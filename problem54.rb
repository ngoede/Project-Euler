class Card
  include Comparable
  
  SuitLookup = {
    "H" => :hearts,
    "C" => :clubs,
    "S" => :spades,
    "D" => :diamonds,
  }
  
  NumLookup = {
    "2" => 1,
    "3" => 2,
    "4" => 3,
    "5" => 4,
    "6" => 5,
    "7" => 6,
    "8" => 7,
    "9" => 8,
    "T" => 9,
    "J" => 10,
    "Q" => 11,
    "K" => 12,
    "A" => 13
  }
  
  attr_reader :suit, :num
  
  def initialize(card_text)
    @num = NumLookup[card_text[0..0]]
    @suit = SuitLookup[card_text[1..1]]
  end
  
  def <=>(other)
    self.num <=> other.num
  end
end

class HandType
	def initialize(&block)
		@block = block
	end
	
	def match hand
		block.call(hand)
	end
end

class Hand
  attr_reader :cards
  
  def initialize(cards_strings)
    @cards = cards_strings.map {|s| Card.new s}
  end
  
  def >(right)
    self_best_card = self.cards.sort[-1]
    right_best_card = right.cards.sort[-1]
    self_best_card > right_best_card
  end
end

def royal_flush
	sf = straight_flush(hand)
	if sf.match? and sf.high_card_in_set.num == 13 then
		sf
	else
		Struct.new :match? => false
	end
end

def straight_flush
	if flush(hand).match? and straight(hand).match? then
		Struct.new :match? => true, :high_card_in_set => hand.cards.sort[-1], :high_card => nil
	else
		Struct.new :match? => false
	end
end

def flush hand
	if hand.cards.all? {|c| c.suit == hand.cards[0].suit } then
		Struct.new :match? => true, :high_card_in_set => hand.cards.sort[-1], :high_card => nil
	else
		Struct.new :match? => false
	end
end

def four_of_a_kind hand
	s = sets(hand)
	if not s.empty? and s.first.length == 4 then
		Struct.new :match? => true, :high_card_in_set => s.first[0], :high_card => nil
	else
		Struct.new :match? => false
	end
end

def three_of_a_kind hand
	s = sets(hand)
	if not s.empty? and s.length == 1 and s.max_by {|k,v| v.length}.length == 3 then
		Struct.new :match? => true, :high_card_in_set =>  s.max_by {|h| h.length}[0], :high_card => nil
	else
		Struct.new :match? => false
	end
end

def two_pairs hand
	s = sets (hand)
	if not s.empty? and s.length == 2 and s.all? { |k,v| v.length == 2 }
		Struct.new :match? => true, :high_card_in_set =>  s.max_by {|h| h.length}[0], :high_card => hand.cards.max
	else
		Struct.new :match? => false
	end
end

def sets hand
	 hand.cards.group_by { |c| c.num }.select {|key,value| value.length > 1 }
end

def straight hand
	sorted_hand = hand.cards.sort
	if sorted_hand[-1].num - sorted_hand[0].num == 5 and sorted_hand.group_by {|c| c.num}.length == 5 then
		Struct.new :match? => true, :high_card_in_set => sorted_hand[-1], :high_card => nil
	else
		Struct.new :match? => false
	end
end

p1 = Hand.new %w{5D 8C 9S JS AC}
p2 = Hand.new %w{2C 5C 7D 8S QH}

p p1 > p2 