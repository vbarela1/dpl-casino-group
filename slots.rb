require_relative 'player'

class Slots 
  attr_accessor :type  

  @slot = ['Cherry', 'Orange', 'Banana', 'Bar','Bell']

  def initialize(player)
      @player = player
      puts "Welcome to Slots #{@player}!"
      bet
    end

  def bet
    puts 'How much would you like to bet?'
    user_bet = gets.chomp_to.f
    puts 'Activating slot machine.'
    spin 
  end 

end 

@slots = Slots.new(@player)

 if s1==s2 && s2==s3
    3
  elsif s1==s2 || s2==s3 || s1==s3
    2
  else
    0
  end















