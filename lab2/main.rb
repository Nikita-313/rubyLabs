def foo(digit, word)
  if word[-1] == 'S' && word[-2] == 'C'
    digit**word.length
  else
    word.reverse
  end
end

def create_pokemons
  puts 'Введите число покемонов:'
  number = gets.to_i
  pokemons = []
  number.times do |value|
    pokemon = {}
    puts "Введите имя покемона №#{value + 1}:"
    pokemon['name'] = gets.chomp
    puts "Введите цвет покемона №#{value + 1}:"
    pokemon['color'] = gets.chomp
    pokemons << pokemon
  end
  pokemons
end

p create_pokemons
