require_relative 'bank'
require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'interface'
require_relative 'deck'
require_relative 'game'


print "Введи свое имя и ставку(не больше 100)\n"
name = gets.chomp
bet = gets.chomp.to_i
Game.new(name).start(bet)