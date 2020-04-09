require 'json'
require 'date'

# Читаємо вміст файлу <signs.json>

file = File.read("#{__dir__}/data/signs.json", encoding: 'utf-8')

# Парсимо файл

signs = JSON.parse(file)

# Запитуємо у користувача дату народження

puts "Введіть дату вашого народження (у форматі ДД.ММ, наприклад, 25.04)"
user_date_string = STDIN.gets.chomp

# Створюємо об'єкт класу <Date>

user_date = Date.parse(user_date_string + '.2000')

# Об'являємо необхідні перемінні

user_sign = nil
user_image = nil

# Цикл - вибірка
# <_> - назва тегу json об'єкта
# <sign> - значення тегу json об'єкта

signs.each do |_, sign|

sign =~ /^capricorn.+$/

	start_date = Date.parse("#{sign["dates"].split(" - ")[0]}.2000")
	end_date   = Date.parse("#{sign["dates"].split(" - ")[1]}.2000")

	if (user_date >= start_date) && (user_date <= end_date)

		# Поправка 
		if (_ =~ /^capricorn.+$/) != nil
			_ = "capricorn"
		end

		# Шлях до файлу, який містить "зображення" знаку зодіаку
		user_image = "#{__dir__}/data/sign_#{_}.txt"

		# Знак зодіаку, який відповідає дню народження користувача
		user_sign = sign

	end
end

# Виводимо результат

puts "\n"
puts "За знаком зодіаку ви #{user_sign['text']} (#{user_sign['dates']})"
puts "\n"

# Зчитуємо построчно файл, який містить "зображення" знаку зодіаку

image_lines = File.readlines(user_image)

# Виводимо зображення із боковим відступом

image_lines.each do |line|
	puts "\t"+line
end

puts "\n"