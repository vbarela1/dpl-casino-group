# require_relative 'casino' this method of file linking does not seem to work

class Slots
  def initialize
    puts '**** Welcome to Slots ****'
    puts 'Game and betting instructions:'
    puts '1 cherry = win'
    puts 'If you win, your bet is doubled'
    puts 'If you lose, you lose your bet amount'
    puts 'Would you like to play: yes or no?'
    @user_input_slots_startup = gets.chomp
      if @user_input_slots_startup == 'yes'
        slots_bet
      end
      if @user_input_slots_startup == 'no'
        'Maybe another time, you are being taken back to the main menu'
         exit(0)#Casino.menu this method was tried and did not work for linking back to casino
      end
  end

  def slots_bet
    puts 'How much do you want to bet?'
    @user_input_slots_bet = gets.chomp.to_f
    #find a way to take this bet and add winnings to wallet or subtract bet from wallet
    #if player reaches 0, find a way to link back to atm in wallet
    puts "Here is your bet: $#{@user_input_slots_bet}"
    puts "Here is what you may win $#{@user_input_slots_bet * 2}"
    puts 'Good luck'
    slots_game
  end

  def slots_game
    @slots = ['Cherry', 'Banana', 'Orange', 'Apple', 'Grape', 'Bar']
    puts 'And the slot machine result is:'
    puts ''
    if @slots.sample == 'Cherry'
      puts '** cherry **' #find ruby gem that inserts cherry symbols
      puts 'WIN!!!!!!!'
      puts "You just won #{@user_input_slots_bet * 2}"
    else
      puts @slots.sample[0..5]
      puts 'Lose'
      # goes back to user slots menu
    end
  end
end

Slots.new
#want to show a welcome to slots sign
#eventually throw in a cool sound when you enter slots
#eventually throw in a neat sign that appears with the name slots
#define how to win slots
#push start to play
#display cost of one round of slots
#eventually allow for slots to accept different amounts of bets
#display slot choices 1 at a time
#have a message of good luck
#count up winning combinations
#message saying you won
#display how much you won
#ask if user wants to play again/go to another game/check value of wallet/quit
#link to different menus
#link back to start of game
