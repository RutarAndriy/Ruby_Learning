require 'date'
require 'rexml/document'

file_name = File.dirname(__FILE__) + '/My_expenses.xml'

# unless true == if false
# Якщо файл не знайдено - завершуємо програму

unless File.exist?(file_name)
  abort "Файл #{file_name} не найдено"
end

# Відкриваємо новий файл

file = File.new(file_name)

# Зчитуємо вміст файлу за допомогою бібліотеки rexml

begin
	doc = REXML::Document.new(file)
rescue
	abort "Помилка відкривання xml"
end

# Закриваємо файл

file.close

# Запитуємо дані у користувача

puts "Скільки ви витратили грошей?"

expense_amount = STDIN.gets.chomp.to_f

puts "На що ви витратили гроші?"

expense_text = STDIN.gets.chomp

puts "Вкажіть дату витрати у форматі ДД.ММ.РРРР, наприклад 25.04.1995 \n" \
	 "(пусте поле - сьогоднішня дата)"

date_input = STDIN.gets.chomp

# Обробляємо час витрати

expense_date = nil

if date_input == ""
	expense_date = Date.today
else
	begin 
		expense_date = Date.parse(date_input)
	rescue ArgumentError
		expense_date = Date.today
	end
end

# Знайдемо кореневий елемент xml

expenses = doc.elements.find("expenses").first

# Додамо новий тег із атрибутами

attributes = {
	"date"		=>	expense_date.strftime("%d.%m.%Y"),
	"amount"	=>	expense_amount
}

expense = expenses.add_element("expense", attributes)

# Задаємо вміст (текст) тегу

expense.text = expense_text

# Перезаписуємо файл

file = File.new(file_name, "w:UTF-8")

doc.write(file, 2)

file.close

# Виводимо інформаційне повідомлення

puts "Інформвція успішно збережена"