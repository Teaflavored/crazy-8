require_relative "card"

class Deck
  attr_reader :cards
  
  def self.generate_cards
    [].tap do |cards|
      (1..13).each do |value|
        [:clubs, :diamonds, :spades, :hearts].each do |suit|
          cards << Card.new(value, suit)
        end
      end
    end
  end
  
  def initialize(cards = Deck.generate_cards)
    @cards = cards
  end
  
  def count
    @cards.count
  end
  
  def shuffle!
    @cards.shuffle!
  end
  
  def draw
    raise "out of cards" if empty?
    @cards.pop
  end
  
  def empty?
    count == 0
  end
end