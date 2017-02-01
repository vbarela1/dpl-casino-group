require 'pry'
require_relative 'deck'

class Blackjack

  def initialize(player, casino)
    @player_hand = []
    @dealer_hand = []
    @player_value = []
    puts 'Welcome to Blackjack!'
    puts 'How much would you like to bet?'
    user_input = gets.chomp.to_i
    new_deck
    first_player_deal
  end

    def new_deck
      @cards = Deck.new.cards.shuffle
    end

    def first_player_deal
      puts 'Here are your cards: '
      2.times { |i| @player_hand << @cards.shift }
      @player_hand.each { |card| card.print_card }
      puts 'Here are the dealers cards: '
      dealer_deal
    end

    def dealer_deal
      2.times { |i| @dealer_hand << @cards.shift }
      @dealer_hand.first.print_card
      second_deal
    end

    def second_deal
      puts 'Type 1 to stay, type 2 to hit.'
      user_input = gets.chomp.to_i
      if user_input == 1
        dealer_second
      else user_input == 2
        puts 'Here is your card: '
        1.times { |i| @player_hand << @cards.shift }
        @player_hand.each { |card| card.print_card }
        calculate_hand_value
      end
    end

    def calculate_hand_value
      value = 0
      @player_hand.each do |card|
        if card.rank =~ /J|Q|K/
          value += 10
        elsif card.rank == 'A'
          value += 11
        else
          value += card.rank.to_i
        end
      end
      display_hand_value(value)
    end

    def display_hand_value(value)
      # puts "this is the value:  #{value}"
      if value > 21
        puts 'Bust'
        #give options here
        
      end
      if value < 21
        second_deal
      end
      if value == 21
        puts '21 WINNER!!'
        new_deck
        first_player_deal
      end
    end

    def calculate_hand_value_dealer
      value = 0
      @dealer_hand.each do |card|
        if card.rank =~ /J|Q|K/
          value += 10
        elsif card.rank == 'A'
          value += 11
        else
          value += card.rank.to_i
        end
      end
      dealer_hand_value(value)
    end

    def dealer_hand_value(value)
      if value > 21
        puts 'You win!!!'
      elsif  value <= 17
        puts 'Dealers deal: '
        1.times { |i| @player_hand << @cards.shift }
        @dealer_hand.each { |card| card.print_card }
      else
        'You lose'
      end
    end

def dealer_second
  @dealer_hand.each { |card| card.print_card }
  calculate_hand_value_dealer
end

end

    #once they say stay, deal to dealer
    #if hits over 21 bust take bet from wallet
    #if dealer > user user loses
    #if user > dealer win
    #place money of bet in user wallet
