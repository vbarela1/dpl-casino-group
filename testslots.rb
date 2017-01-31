def slots_game
  @slots = ['Cherry', 'Banana', 'Orange', 'Apple', 'Grape', 'Bar']
  if @slots.sample == 'Cherry'
    puts '** cherry **' #find ruby gem that inserts cherry symbols
    puts 'Win'
  else
    puts 'Lose'
  end
end

slots_game
