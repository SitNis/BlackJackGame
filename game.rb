require_relative 'bank'
require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

class Game
  attr_accessor :player, :dealer, :deck, :bank

  def initialize(name)
    @player = Player.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    @interface = Interface.new
  end

  def start(value)
    @player.start_hand(@deck)
    @dealer.start_hand(@deck)
    new_bet(value) 
    main_menu
  end

  def main_menu
    end_game if @player.hand.length == 3
    button =  @interface.main_menu(@player, @dealer, @bank)
    case button
    when "1"
      card_draw
    when "2"
      player_scip
    when "3"
      end_game
    end
  end

  def card_draw
    @player.take_card(deck)
    @dealer.take_card(deck)
    main_menu
  end

  def player_scip
    @dealer.take_card(deck)
    main_menu
  end

  def new_bet(value)
    @player.bet(value)
    @dealer.bet(value)
    @bank.bank += 2*value
    main_menu
  end


  def play_again
    button = @interface.play_again
    case button
    when "1"
      print "Введи ставку(не больше 100)\n"
      bet = gets.chomp.to_i
      Game.new(@player.name).start(bet)
    when "2"
      exit
    end
  end

  def end_game
    puts "Рука диллера:"
    @dealer.hand.each { |card| puts card.name + card.suit }
    puts "Очки диллера:#{@dealer.score}"
    puts "Твоя рука:"
    @player.hand.each { |card| puts card.name + card.suit }
    puts "Твои очки:#{@player.score}"
    if @player.score > @dealer.score and @player.score <= 21
      @player.bank += bank.bank
      @bank.bank = 0
      puts "Ты победил!"
    elsif @player.score == @dealer.score
      @player.bank += @bank.bank/2
      @dealer.bank += @bank.bank/2
      @bank.bank = 0
      puts "Ничья!"
    else
      @dealer.bank += bank.bank
      @bank.bank = 0
      puts "Ты проиграл!"
    end
    play_again
  end
end
