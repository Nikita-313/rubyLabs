def foo
  file_data = File.read('students.txt').split("\n")
  ages = file_data.map { |element| element[-2] + element[-1]}.uniq

  while ages != []
    puts 'Введите возраста:'
    age = gets.chomp
    if age == '-1'
      File.read('results.txt').split("\n").each { |e|  p e}
      File.delete('results.txt')
      break
    end

    ages.delete(age)
    file_data.each do |element|
      File.write('results.txt', "#{element}\n", mode: 'a') if element[-2] + element[-1] == age
    end
  end
end




