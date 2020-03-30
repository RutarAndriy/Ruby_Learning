# Отримуємо шлях до запущеного файлу *.rb

current_path = File.dirname(__FILE__)

# Задаємо шлях до файлу, який необхідно прочитати

file_path = "#{current_path}/text/Test_file.txt"

# Перевірка наявності файлу

if File.exist?(file_path)

	# Відкривання файлу в заданому кодуванні
	# r: — тільки для читання
	# w: — тільки для запису (перезапис)
	# a: — тільки для запису (запис у кінець файлу)

	file = File.new(file_path, "r:UTF-8")

	# Метод <read> повертає вміст файлу у вигляді однієї строки
	# Метод <readlines> повертає вміст файлу у вигляді масиву строк

	text = file.readlines

	# Метод <sample> повертає випадковий елемент із масиву

	puts "Цитата для:"
	puts text.sample

	file.close

else

	puts "Файл не знайдено"

end