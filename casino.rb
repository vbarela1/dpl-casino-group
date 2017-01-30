require 'pry'
require 'colorize'
require 'artii'
require_relative 'player' #copy paste 

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

  end 
end

Casino.new

