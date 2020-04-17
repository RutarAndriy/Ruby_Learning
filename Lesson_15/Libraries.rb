# Підкючення бібліотеки <io-console>
require "io/console"

puts "Використання бібліотеки \"io-console\""
puts "\n"

puts "Незахищене поле ввделення тексту"

text_1 = STDIN.gets.chomp

puts "\n"
puts "Захищене поле ввделення тексту"

# Використання бібліотеки для приховування введеного тексту
text_2 = STDIN.noecho(&:gets).chomp

puts "\n"

# Виведення результату

puts "Текст із першого поля: \"#{text_1}\""
puts "Текст із другого поля: \"#{text_2}\""