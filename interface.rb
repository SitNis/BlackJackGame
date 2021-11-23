
class Interface

  def menu
    puts "\n
    1 - Начать игру\n
    2 - Выйти\n"
    button = gets.chomp()
  end

  def start_game
    puts "\n
    Введи имя пользователя\n"
    name = gets.chomp()
  end

  def main_menu(player, dealer, bank)
    puts "Твоя рука:"
    player.hand.each { |card| puts card.name + card.suit }
    puts "Твои очки:#{player.score}"
    puts "Рука диллера:#{"*"*dealer.hand.length}\t"
    puts "Действия:\n
    1 - Взять карту\t 2 - Пропустить ход\t 3 - Открыть руку"
    button = gets.chomp
  end

  def play_again
    puts "Хочешь сыграть еще?\n
    1 - Да\n
    2 - Нет\n"
    button = gets.chomp
  end

end