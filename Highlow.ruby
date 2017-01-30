require_relative 'wallet'

class HighLow
  attr_accessor :name, :bet

  def initialize(player)
    @player = player
    puts "Welcome to High/Low #{player.name}!"
    cards
  end

  def cards
    win = 'Congratulations you have won $1.00'
    lose = 'Bummer you just lost $1.00'
    if(@player.wallet.amount <= 0)
      puts 'You are out of money'
      puts 'Go to the ATM'
      puts 'how much money do you want to withdraw?'
      withdraw = gets.chomp.to_i
      @player.wallet = Wallet.new(withdraw)
    end
  puts 'Here is your first card:'
  @card1 = 1 + rand(10)
  puts @card1
  puts 'Will the next card be higher or lower?'
  @user_bet = gets.chomp
  @card2 = 1 + rand(10)
  puts @card2
    case
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
