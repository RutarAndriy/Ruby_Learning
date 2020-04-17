require 'date'
require 'rexml/document'

file_name = File.dirname(__FILE__) + '/my_expenses.xml'

# unless true == if false
# Якщо файл не знайдено - завершуємо програму

unless File.exist?(file_name)
  abort "Файл #{file_name} не найдено"
end

# Відкриваємо новий файл
file = File.new(file_name)

# Зчитуємо вміст файлу за допомогою бібліотеки rexml
doc = REXML::Document.new(file)

# Закриваємо файл
file.close

# Хеш, який містить список днів та суми грошей, потрачених у конкретний день
amount_by_day = {}

# Отримуємо із документу всі теги <expense> і в циклі проходимося по них

doc.elements.each('expenses/expense') do |item|

    # Потрачена сума
    loss_sum = item.attributes['amount'].to_f

    # Дата
    loss_date = Date.parse(item.attributes['date'])

    # Тонорне присвоєння (задаємо значення перемінної, якщо вона пуста (дорівнює nil))
    # Еквівалент запису: amount_by_day[loss_date] = 0 if amount_by_day[loss_date] == nil
    amount_by_day[loss_date] ||= 0

    # Додаємо суму витрачених грошей конкретного дня
    amount_by_day[loss_date] += loss_sum

end

# Хеш витрат по місяцях
sum_by_month = {}

# Проходимося в циклі по усіх записах

amount_by_day.keys.sort.each do |key|

    # Записуємо суми витрат за кожен окремий місяць
    sum_by_month[key.strftime("%B %Y")] ||= 0
    sum_by_month[key.strftime("%B %Y")] += amount_by_day[key]

end

# Перший місяць у посортованому масиві даних
current_month = amount_by_day.keys.sort[0].strftime("%B %Y")

# Виводимо результат для першого місяця

puts "-- #{current_month}, усього витрачено: " \
     "#{sum_by_month[current_month]} грн. --"

# Цикл по усіх днях

amount_by_day.keys.sort.each do |key|

    # Якщо конкретний день належить до іншого місяця,
    # то виводимо інформацію про даний місяць
    if key.strftime("%B %Y") != current_month
        
        current_month = key.strftime("%B %Y")
        puts "-- #{current_month}, усього витрачено: " \
             "#{sum_by_month[current_month]} грн. --"

    end

    # Виводимо витрати за конкретний день
    puts "\t#{key.strftime("%B %d")}: #{amount_by_day[key]} грн."

end