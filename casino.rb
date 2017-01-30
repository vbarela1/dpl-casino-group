require 'pry'
require 'colorize'
require 'artii'
# require_relative 'player' #copy paste

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
    player.info
    # output a menu of games
    # also include a menu option to check the players info - should probably be a class on the player
  end
end

Casino.new
