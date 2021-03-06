# Передавання параметрів без дужок
puts "Строка 1"

# Передавання параметрів в дужках
# Зайві пробіли ігноруються

puts("Строка 2")
puts ("Строка 3")
puts  ("Строка 4")

# Масив імен
names = ["Андрій", "Наталя", "Борис", "Оля", "Сергій"]
puts names.to_s

# Метод без параметрів
# Видалення останього елемента із масиву

names.pop 
puts names.to_s

# Метод із параметрами
# Видалення останніх 2 елементів із масиву

names.pop 2
puts names.to_s

# Метод <now> класу <Time> повертає значення
# часу на даний момент

puts "\n"
time = Time.now
puts time
puts "\n"

# Власний метод без параметрів

def method_1
	puts "Метод без параметрів"
end

# Власний метод з одним параметром

def method_2 (val)
	puts "Метод з параметром #{val}"
end

# Власний метод з декількома параметрами

def method_3 (val_1, val_2, val_3)
	puts "Метод з параметрами: " +
	     "#{val_1}, #{val_2}, #{val_3}"
end

# Власний метод, який повертає значення

def method_4 (val_1, val_2)
	puts "Метод який повертає значення " +
	     "#{val_1} + #{val_2}"
    return val_1 + val_2
end

# Викликання методів

method_1
method_2 1
method_3 1, 2, 3

result = method_4 1, 2

# Перевірка, чи отриманий результат є числом

puts "\n"
is_number = result.is_a?(Numeric)
puts "Результат є числом: #{is_number}"