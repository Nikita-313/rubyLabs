def greeting(name, surname, age)
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"

  else "Привет, #{name} #{surname}. Самое время заняться делом!" end
end

def foobar(a, b)
  if a == 20 || b == 20
    b
  else a + b end
end
