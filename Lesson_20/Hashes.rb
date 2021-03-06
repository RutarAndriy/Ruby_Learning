hash = nil

# Створюємо новий асоціативний масив (хеш)

hash = {

"A" => "1",
"B" => "2",
"C" => "3"

}

# Додавання нового елементу до хешу

hash["D"] = "4"

puts "Хеш містить ключ <A>: #{hash.has_key?("A")}"
puts "Хеш містить ключ <G>: #{hash.has_key?("G")}"

puts "Хеш містить значення <1>: #{hash.has_value?("1")}"
puts "Хеш містить значення <7>: #{hash.has_value?("7")}"

puts "Елемент <A>: #{hash["A"]}"
puts "Елемент <B>: #{hash["B"]}"
puts "Елемент <C>: #{hash["C"]}"
puts "Елемент <D>: #{hash["D"]}"

# Видалення елементів з хешу

hash.delete("A")

puts "Усі доступні ключі: #{hash.keys}"
puts "Усі доступні значення: #{hash.values}"