require 'artii'
require_relative 'wallet'

class HighLow

  def initialize(player, casino)
    @casino = casino
    @player = player
    a = Artii::Base.new
    puts a.asciify("Welcome to High/Low #{player.name}!")
    puts 'To go back to the Casino type 1'
    puts 'To play HighLow type 2'
    user_input = gets.chomp.to_i
      if user_input == 1
        @casino.menu
      else user_input == 2
        cards
      end
  end

  def cards
    win = 'Congratulations you have won $1.00'
    lose = 'Bummer you just lost $1.00'
    if(@player.wallet.amount <= 0)
      puts 'You are out of money'
      puts 'Go to the ATM'
      @player.wallet.atm
    end
  puts 'Here is your first card:'
  @card1 = 1 + rand(10)
  puts @card1
  puts 'Will the next card be higher or lower?'
  puts 'To go back to the Casino type 1'
  @user_bet = gets.chomp
  @card2 = 1 + rand(10)
  puts @card2
    case
    when @user_bet == '1'
      @casino.menu
    when @card2 > @card1 && @user_bet == 'higher'
      win
      @player.wallet.amount = @player.wallet.amount + 1
      puts "You have this much left #{@player.wallet.amount}"
      cards
    when @card2 < @card1 && @user_bet == 'lower'
      win
      @player.wallet.amount = @player.wallet.amount + 1
      puts "You have this much left #{@player.wallet.amount}"
      cards
    when @card2 > @card1 && @user_bet == 'lower'
      lose
      @player.wallet.amount = @player.wallet.amount - 1
      puts "You have this much left #{@player.wallet.amount}"
      cards
    when @card2 < @card1 && @user_bet == 'higher'
      lose
      @player.wallet.amount = @player.wallet.amount - 1
      puts "You have this much left #{@player.wallet.amount}"
      cards
    else @card2 == @card1
      puts 'Draw, try again'
      puts "You have this much left #{@player.wallet.amount}"
      cards
    end
  end
end
