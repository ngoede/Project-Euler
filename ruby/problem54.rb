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

class HandResult
	attr_reader :match?, :cards_in_set

	def initialize(match?, cards_in_set, cards_not_in_set)
		@match? = match?
		@cards_in_set = cards_in_set
	end
end

class Hand
  	attr_reader :cards
  
  	def initialize(cards_strings)
    	@cards = cards_strings.map {|s| Card.new s}
  	end

  	def check_hand(self_result, hand_result)
  		if(self_result.match? and hand_result.match?) then
  			if self_result.high_card_in_set == hand_result.high_card_in_set then
  				return self_result.
  			return self_result.high_card_in_set > hand_result
  		end
  	end

  	def beats hand
  		hand_types = [
  			:royal_flush,
  			:straight_flush,
  			:four_of_a_kind,
  			:full_house, #implement
  			:flush,
  			:straight,
  			:three_of_a_kind,
  			:two_pairs,
  			:pair #implement
  			:high_card #implement
  		]
  		hand_types.each do |type|
  			self_result = self.method(type).call()
  			hand_result = hand.method(type).call()
  			check_hand(self_result, hand_result)

  	end

  	NO_MATCH = HandResult.new false, []
 
	def royal_flush
		sf = straight_flush(self)
		if sf.match? and sf.cards_in_set.sort.first.num == 13 then
			sf
		else
			NO_MATCH
		end
	end

	def straight_flush
		if flush(hand).match? and straight(self).match? then
			HandResult.new true, self.cards
		else
			NO_MATCH
		end
	end

	def flush
		if self.cards.all? {|c| c.suit == self.cards[0].suit } then
			HandResult.new true, self.cards
		else
			NO_MATCH
		end
	end

	def four_of_a_kind
		s = sets(self)
		if not s.empty? and s.first.length == 4 then
			HandResult.new true, s.first
		else
			NO_MATCH
		end
	end

	def three_of_a_kind
		s = sets(self)
		if not s.empty? and s.first.length == 3 then
			HandResult.new true, s.first, s.last
		else
			NO_MATCH
		end
	end

	def two_pairs
		s = sets (self)
		if not s.empty? and s.length == 2 and s.all? { |k,v| v.length == 2 }
			HandResult.new true, sets.flatten
		else
			NO_MATCH
		end
	end

	def straight
		sorted_hand = self.cards.sort
		if sorted_hand[-1].num - sorted_hand[0].num == 5 and sorted_hand.group_by {|c| c.num}.length == 5 then
			Struct.new :match? => true, :high_card_in_set => sorted_hand[-1], :high_card => nil
		else
			NO_MATCH
		end
	end

	def sets (hand)
		 hand.cards.group_by { |c| c.num }.select {|key,value| value.length > 1 }.sort_by {|s| s.length}
	end
end

p1 = Hand.new %w{5D 8C 9S JS AC}
p2 = Hand.new %w{2C 5C 7D 8S QH}

p p1 > p2 