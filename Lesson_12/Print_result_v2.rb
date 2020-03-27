class Print_result_v2

# Метод відображає статус гри

def show_Status (core)

	clear()
	puts "Гра \"Вгадай слово\" v2.0"
	puts "\n"

	puts "Слово: " + get_Word_For_Print(core.mystery_word, core.good_letters)

	if (core.mystery_word.uniq.size == core.good_letters.size)
		puts "\n"
		abort "Ви вгадали слово. Вітаємо!"
	elsif (core.errors_count >= 7)
		puts "\n"
		abort "Слово не було відгадане. Ви програли :("
	end

	wrong_letters = ""
	if (core.errors_count > 0) 
		wrong_letters = ": [#{core.bad_letters.join(", ")}]"
	end

	puts "\n"
	puts "Кількість помилок #{core.errors_count}#{wrong_letters}"
	puts "У вас залишилося спроб: " + (7 - core.errors_count).to_s

end

# Метод очищує консоль

def clear()

	system "clear" or system "cls"

end

# Метод виводить слово із відображенням відгаданих та невідгаданих літер

def get_Word_For_Print (mystery_word, good_letters)

	result = ""

	for letter in mystery_word do
		if (good_letters.include?(letter))
			result += letter + " "
		else
			result += "__ "
		end
	end

	return result	

end

# Кінець класу <Print_result_v2>

end