
require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'

class Casino
  #TO DO: HANDLE MULTI PLAYERS
  #hint: think array
  attr_accessor :player

  def initialize
    puts'Welcome To The Casino!'
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
        Slots.new(player)
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
