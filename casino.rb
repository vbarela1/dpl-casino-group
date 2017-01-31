##game players bank rolls
#
## require_relative 'slots' this method does not seem to work for file linking


require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'
require_relative 'highlow'
require_relative 'slots'

class Casino
  #TO DO: HANDLE MULTI PLAYERS
  #hint: think array
  attr_accessor :player

  def initialize
    a = Artii::Base.new
    puts a.asciify('Welcome To The Casino!')
    @player = Player.new  #instance variable
    puts "What game do you want to play #{player.name}?"
    menu
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
        #Slots.new # not correct method for having user go to this class
        Slots.new(player, self)
      when 3
        HighLow.new(player, self)
      when 4
        puts 'Thanks for playing!!'
        exit(0)
      else
        puts 'Invalid Input!'
        menu
    end
    # also include a menu option to check the players info - should probably be a class on the player
  end
end

@casino = Casino.new
