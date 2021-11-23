
class Player

  attr_accessor :hand, :score, :bank, :name

  def initialize(name)
    @name = name
    @hand = []
    @score = 0
    @bank = 100
  end

  def start_hand(deck)
    2.times do
      card = deck.give_card
      self.hand << card
    end
    start_score
  end

  def take_card(deck)
    if self.hand.length == 2
      self.hand << deck.give_card
      update_score
    end
  end

  def bet(value)
    if self.bank > value
      self.bank -= value
    else 
      puts "Нет денег"
    end
  end

  private

  def start_score
    self.hand.each do |card|
      if card.name.to_i.zero?
        if card.name == "T"
          self.score + 11 <= 21 ? self.score += 11 : self.score += 1
        else
          self.score += 10
        end
      else
        self.score += card.name.to_i
      end
    end
  end

  def update_score
    self.hand.last.name == "T" and self.score + 11 <= 21 ? self.score += 11 : self.score += 1
    self.hand.last.name.to_i.zero? ? self.score += 10 : self.score += self.hand.last.name.to_i
  end

end