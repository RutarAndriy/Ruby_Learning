# Обробка помилок

begin

	puts "A = 5 * 7 = #{5 * 7}"
	puts "B = 7 / 0 = #{7 / 0}"
	puts "C = 3 + 4 = #{3 + 4}"

rescue

	puts "Помилка: на нуль ділити не можна"

ensure

	puts "Розрахунок закінчено"

end

puts "\n"

# Обробка конкретної помилки

begin

	puts "A = 9 - 6 = #{9 - 6}"
	puts "B = 2 + 7 = #{2 + 7}"
	puts "C = 9 / 0 = #{9 / 0}"

rescue ZeroDivisionError => error

	puts "Помилка: #{error.message}"

ensure

	puts "Розрахунок закінчено"

end