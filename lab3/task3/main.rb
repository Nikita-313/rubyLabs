def read_balance
  if File.exist?('balance.txt')
    File.read('balance.txt').chomp.to_f
  else
    100.0
  end
end

$balance = read_balance

def check_num(num)
  true_chars = %w[1 2 3 4 5 6 7 8 9 0 .]
  tf = true
  num.each_char do |element|
    if true_chars.include?(element) == false
      tf = false
      break
    end
  end
  tf
end

def deposit
  loop do
    puts 'Введите сумму которую хотите внести:'
    num = gets.chomp
    if check_num num
      $balance += num.to_f
      break
    else
      puts 'Ошибка! Введен не правильный символ! Используйте только цифры.'
    end
  end
end

def withdraw
  loop do
    puts 'Введите сумму которую хотите вывести:'
    num = gets.chomp
    if check_num num
      $balance -= num.to_f
      break
    else
      puts 'Ошибка!Введен не правильный символ! Используйте только цифры.'
    end
  end
end

def show_balance
  p $balance
end

def start
  loop do
    puts 'Введите действие:'
    puts 'D - внести деньги'
    puts 'W - вывести деньги'
    puts 'B - проверить баланс'
    puts 'Q - выйти'
    action = gets.chomp.upcase
    case action
    when 'D'
      deposit
    when 'W'
      withdraw
    when 'B'
      show_balance
    when 'Q'
      File.write('balance.txt', $balance)
      break
    else
      puts "Ошибка! Не опознаное действие: #{action}. Введите одно из следующих действий:"
    end
  end
end



