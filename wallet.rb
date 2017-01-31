class Wallet
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
 end

 def atm
     puts 'How much money do you want to withdraw?'
     withdraw = gets.chomp.to_i
     @amount = withdraw
     puts "Your new balance is #{@amount}"
   end
end
