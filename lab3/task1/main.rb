def index()
  file = File.open("students.txt")
  file.readlines.each do |line|
    line.chomp
  end
end

def find(id)
  line = nil
  file = File.open("students.txt")
  file.each_with_index do |l, index|
    if id == index + 1
      line = l
    end
  end
  line
end

def where(pattern)
  file = File.open("students.txt")
  line = nil
  file.readlines.each do |l|
    if (l.chomp[0, pattern.length] == pattern.to_s) ||
      (l.chomp.reverse[0, pattern.length].reverse == pattern.to_s)
      line = l
    end
  end
  line
end

def update( id, text)
  file = File.open("students.txt")
  temp = File.open("temp.txt", 'w')
  file.each_with_index do |line, index|
    temp.puts(id == index+1 ? text : line)
  end
  temp.close
  File.write(file.path, File.read("temp.txt"))
  File.delete("temp.txt")
end

def delete(id)
  file = File.open("students.txt")
  temp = File.open("temp.txt", 'w')
  file.each_with_index do |line, index|
    temp.puts line if id != index+1
  end
  temp.close
  File.write(file.path, File.read("temp.txt"))
  File.delete("temp.txt")
end
