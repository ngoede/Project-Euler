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

p1 = Hand.new %w{5D 8C 9S JS AC}
p2 = Hand.new %w{2C 5C 7D 8S QH}

p p1 > p2 