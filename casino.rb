require 'pry'
require 'colorize'
require 'artii'
# require_relative 'player' #copy paste
class HighLow
  attr_accessor :name, :bet

  def initialize(player)
    puts "Welcome to High/Low"
    @player = player
    binding.pry
    puts "Hi #{@player.name}"
    first_card
  end

  def first_card
    @cards = [1,2,3,4,5]
    puts 'Here is your card'
    puts @cards.sample
    puts 'Will the next card be higher or lower:'
    puts '1: higher'
    puts '2: lower'
    @player_input = gets.chomp
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
