require "uri"
require "net/http"
require "nokogiri"

# Адреса сайту, із якого беруться актуальні дані про погоду
# Посилання використовує керуючі символи для правильного запису кирилиці

url = "https://ua.sinoptik.ua/" +
	  "%D0%BF%D0%BE%D0%B3%D0%BE%D0%B4%D0%B0-%D0%BB%D1%8C%D0%B2%D1%96%D0%B2"

# Створюємо об'єкт типу <URI>
uri = URI.parse(url)

# Відправляємо запит і отримуємо результат
response = Net::HTTP.get_response(uri)

# Парсимо отриманий HTML
doc = Nokogiri::HTML(response.body)

# Виділяємо блок, який містить необхідну нам інформацію
main_block = doc.css('.main')[0]

# Виділяємо необхідні нам дані

day_of_week = main_block.css('.day-link')[0].text
day_of_month = main_block.css('.date')[0].text
month = main_block.css('.month')[0].text

weather = main_block.css('.weatherIco')[0].attribute('title')

min = main_block.css('.min')[0].text.split(" ")[1]
max = main_block.css('.max')[0].text.split(" ")[1]

# Відображаємо результат

puts "\n"
puts "Погода у Львові"
puts "#{day_of_week} #{day_of_month} #{month}"
puts "\n"

puts "#{weather}"
puts "Мінімальна температура:  #{min}C"
puts "Максимальна температура: #{max}C"
puts "\n"