#game players bank rolls 
#

require 'pry'
require 'colorize'
require 'artii'
# require_relative 'player' #copy paste

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


class Wallet
  attr_accessor :amount

  def initialize(amount)
    #randomly give an amount
    @amount = amount
 end
end

class Player
  attr_accessor :name, :wallet

  def initialize
    puts 'What is your name player?'
    @name = gets.strip
    puts 'How much money are you playing with?'
    @wallet = Wallet.new(gets.to_f) #instatuates a new wallet
  end

  def info
    puts "Players Name Is: #{name} And Player Has: #{wallet.amount}"
  end
end

class Casino
  #TO DO: HANDLE MULTI PLAYERS
  #hint: think array
  attr_accessor :player

  def initialize
    puts'Welcome To The Casino!'.colorize(:blue)
    @player = Player.new  #instance variable
    puts "What game do you want to play #{player.name}?"
    menu
  #show casino game manu
  #let player choose a game
  #initialize the new game passing the player as a parameter
  end

  def menu
    puts '*** Casino Menu ***'
    puts '1) Player Info'
    puts '2) Slots'
    puts '3) High / Low'
    puts '4) Exit'
    choice = gets.to_i
    case choice
      when 1
        player.info
        menu
      when 2
        # Slots.new(player)
        # menu
      when 3
        HighLow.new(player)
        # menu
      when 4
        puts 'Thanks for playing!!'
        exit
      else
        puts 'Invalid Input!'
        menu
    end
    # also include a menu option to check the players info - should probably be a class on the player
  end
end

Casino.new
