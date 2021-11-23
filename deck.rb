
class Deck

  attr_accessor :curr_deck

  def initialize
    @curr_deck = []
    new_deck
  end

  def give_card
    given_card = self.curr_deck.sample
    self.curr_deck.delete(given_card)
    return given_card
  end

  private

  def new_deck
    Card::NAME_CARD.each do |name|
      Card::SUIT_CARD.each do |suit|
        card = Card.new(name.to_s, suit)
        @curr_deck << card
      end
    end
  end

end