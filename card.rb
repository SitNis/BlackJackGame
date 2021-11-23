class Card

  attr_reader :SUIT_CARD,:NAME_CARD, :name, :suit
  attr_accessor :value

  SUIT_CARD = ["<3","+","<>","^"].freeze
  NAME_CARD = [2,3,4,5,6,7,8,9,10,"V","Q","K","T"].freeze

  def initialize(name,suit)
    @name = name
    @suit = suit
  end

end