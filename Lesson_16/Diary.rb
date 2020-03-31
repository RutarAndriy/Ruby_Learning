# Довідкова інформація

puts "Програма шоденник v1.0"
puts "\n"
puts "Введіть те, що у вас на думці чи в душі :)"
puts "Все що було введено до строки \"end\" буде збережено у файл"
puts "\n"

current_path = File.dirname(__FILE__)

line = nil
all_lines = []

# Цикл читання введених даних

while line != "end" do

	line = STDIN.gets.encode("UTF-8").chomp
	all_lines << line

end

all_lines.pop

# Отримання часу

time = Time.new

file_name = time.strftime("%Y-%m-%d")
time_string = time.strftime("%H:%M")

separator = "-------------------------"

# Відкривання файлу (або його створення) для дозаписування інформації

file = File.new("#{current_path}/#{file_name}.txt", "a:UTF-8")

# Запис у фвйл строки

file.print("\n\t#{time_string}\n\n")

for item in all_lines do

	# Запис у файл строки із переведенням на новий рядок
	file.puts(item)

end

file.puts(separator)
file.close()

# Інформація про результат

puts "\n"
puts "Запис був зроблений в #{time_string}"
puts "Ваші дані були успішно записані у файл #{file_name}.txt"