require "./My_class.rb"

# Створення екземпляру нового класу

my_class = My_class.new

puts "Чи використовувався метод \"my_Method\" в програмі: " + 
     "#{my_class.is_My_Method_Use?}"

# Виклик власного методу <my_Method>

my_class.my_Method()

puts "Чи використовувався метод \"my_Method\" в програмі: " + 
     "#{my_class.is_My_Method_Use?}"

# Отримання класу об'єктів

string = "Строка"
array = [1, 2, 3]
number = 37

puts "\n"
puts string + ": #{string.class.name}"
puts array.to_s + ": #{array.class.name}"
puts number.to_s + ": #{number.class.name}"

puts "\n"
puts my_class.to_s + ": #{my_class.class.name}"