# Метод <length> - повертає розмір строки
puts "Тестова строка".length

# Метод <to_f> - переводить ціле число у дробове
puts 17.to_f

# Перемінна <var_01> - строковий тип
# Перемінна <var_02> - числовий тип
# Перемінна <var_03> - невизначений тип

var_01 = ""
var_02 = 37
var_03 = nil

puts var_01.class.name
puts var_02.class.name
puts var_03.class.name

# Оператор <if - else> - перевірка заданої умови

A = true

if (A == true)
	# Виконуємо, якщо <A> = true
	puts "A = true"
else
	# Виконуємо, у всіх інших випадках
	puts "A = false"
end