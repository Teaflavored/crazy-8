require 'card'

RSpec.describe Card do
  subject(:card) { Card.new(10, :clubs) }
  
  describe "Card properties" do
    it "has a value of 10" do
      expect(card.value).to eq 10
    end
    
    it "has suit of clubs" do
      expect(card.suit).to eq :clubs
    end
  
    it "raises error when creating invalid card" do
      expect { Card.new(14, :this) }.to raise_error
    end
  end
  
  describe "to_s" do
    it "returns string of the card" do
      expect(card.to_s).to eq("Ten of Clubs")
    end
  end
  
  describe "==(other_card)" do
    
    it "correctly determines that 6 of clubs and 6 of hearts are equal" do
      card_1 = Card.new(6, :clubs)
      card_2 = Card.new(6, :hearts)
      
      expect(card_1).to eq(card_2)
      expect( card_1 == card_2 ).to be true
    end
    
    it "correctly determines that ace of diamonds and 7 of diamonds are equal" do
      card_1 = Card.new(1, :diamonds)
      card_2 = Card.new(7, :diamonds)
      
      expect(card_1).to eq(card_2)
    end
    
    it "determines when 2 cards don't match suit or value" do
      card_1 = Card.new(7, :clubs)
      card_2 = Card.new(9, :spades)
      
      expect( card_1 == card_2 ).to be false
    end
  end
  
  describe "eq?(suit)" do
    
    it "correctly determines if self is same suit as passed in suit" do
      expect(card.eq?(:clubs)).to be true
      expect(card.eq?(:diamonds)).not_to be true
    end
  end
  
end