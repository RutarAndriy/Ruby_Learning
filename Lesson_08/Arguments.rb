# Масив <ARGV> містить усі аргументи, які були передані програмі

argument = ARGV[0]

# Вирішення проблем із кодуванням на Windows

if (ARGV != nil and Gem.win_platform?)
#  (ARGV[0] and Gem.win_platform?) - альтернативний варіант перевірки

	argument = argument
			  .encode(ARGV[0].encoding, "cp1251")
			  .encode("UTF-8")

=begin

	Альтернативний варіант перекодування параметрів

	argument = argument
		      .dup
			  .force_encoding("IBM866")
			  .encode("IBM866", "cp1251")
			  .encode("UTF-8")

=end

end

# Перевірка наявності аргументів

if (argument == nil)
	puts "Аргументів немає"
else
	puts "Програмі передано " + ARGV.length.to_s + " аргументів"
	puts ARGV.to_s
end

puts "\n"

# Ще один спосіб виведення перемінних

str = "Тест"
num = 25

puts "Строка: #{str}"
puts "Число: #{num}"
puts "\n"

number = -1

# Реалізація вводу даних із перевіркою правильності введених даних

while (number < 0 or number > 100)

	puts "Введіть чисто від 0 до 100"
	number = STDIN.gets.to_i

#   number = gets.to_i
#   Якщо програмі передають аргументи, то такий спосіб не працює

end

# Реалізація <if - elseif - else>

if (number == 100)
	puts "Ви ввели число 100"
elsif (number == 0)
	puts "Ви ввели число 0"
else
	puts "Ви ввели число, яке є більшим за 0 та меншим за 100"
end
	