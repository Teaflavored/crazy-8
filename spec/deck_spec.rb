require 'deck'

RSpec.describe Deck do
  
  subject(:deck) { Deck.new }
  
  describe "Deck" do
    it "initializes with 52 cards" do
      expect(deck.count).to be 52
    end
    
    it "holds all the cards in an array of cards" do
      expect(deck.cards).to be_an(Array)
    end
    
  end
  
  describe "shuffle!" do
    it "shuffles the cards" do
      expect(deck.cards).to receive(:shuffle!)
      
      deck.shuffle!
    end
  end
  
  describe "draw" do
    before { 52.times { deck.draw } }
    
    it "knows when deck is empty" do
      expect(deck.empty?).to be true
    end
    
    it "raises error once deck is out of cards" do
      expect { deck.draw }.to raise_error
    end
  end
  
  describe "drawing 1 card" do
    let(:card) { double("card", value: 10, suit: :clubs) }
    
    before do
      52.times { deck.draw }
      deck.cards << card
      deck.draw
    end
    
    it "draws the card" do
      expect(deck.cards).not_to include(card)
    end
  end
end