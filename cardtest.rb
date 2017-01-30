def cards
puts 'Here is your first card:'
@card1 = 1 + rand(10)
puts @card1
puts 'Will the next card be higher or lower?'
@user_bet = gets.chomp
@card2 = 1 + rand(10)
puts @card2
  case
  when @card2 > @card1 && @user_bet == 'higher'
    puts 'Congratulations you have won $1.00'
    @player.wallet.amount = @player.wallet.amount + 1
  when @card2 < @card1 && @user_bet == 'lower'
    puts 'Congratulations you have won $1.00'
    @player.wallet.amount = @player.wallet.amount + 1
  when @card2 > @card1 && @user_bet == 'lower'
    puts 'Bummer you just lost $1.00'
    @player.wallet.amount = @player.wallet.amount - 1
  when @card2 < @card1 && @user_bet == 'higher'
    puts 'Bummer you just lost $1.00'
    @player.wallet.amount = @player.wallet.amount - 1
  else @card2 == @card1
    puts 'Draw, try again'
    cards
  end
  binding.pry
end

cards
