class Card
  attr_reader :value, :suit
  STRING_MAP = {
    10 => "Ten",
    9 => "Nine",
    8 => "Eight",
    7 => "Seven",
    6 => "Six",
    5 => "Five",
    4 => "Four",
    3 => "Three",
    2 => "Two",
    1 => "Ace",
    11 => "Jack",
    12 => "Queen",
    13 => "King",
    clubs: "Clubs",
    hearts: "Hearts",
    spades: "Spades",
    diamonds: "Diamonds"
  }
  
  def initialize(value, suit)
    raise "invalid card" unless value.between?(1, 13) && STRING_MAP.keys.include?(suit)
    @value = value
    @suit = suit
  end
  
  def to_s
    "#{STRING_MAP[@value]} of #{STRING_MAP[@suit]}"
  end
  
  def ==(other_card)
    self.value == other_card.value || self.suit == other_card.suit
  end
  
  def eq?(suit)
    self.suit == suit
  end
end