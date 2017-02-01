class Card
 # Getter and Setter methods for rank, suit and color
 attr_accessor :rank, :suit, :color, :value
 # Gets called when you call the new method to create an instance
 # card = Card.new('10', 'K', 'Black')
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
 end

 def print_card
   puts "#{color} #{rank} of #{suit}"
 end
end
