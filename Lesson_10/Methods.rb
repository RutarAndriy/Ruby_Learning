# Метод перетворює загадане слово у масив літер

def get_Mystery_Word()

	result = ARGV[0]

	if (Gem.win_platform? && ARGV[0])
		result = result.encode(ARVG[0].encoding, "cp1251").encode("UTF-8")
	end

	if (result == nil or result == "")
		abort "Щоб почати гру введіть загадане слово у якості аргумента при запуску програми"
	end

	result = result.downcase

	return result.split("")

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

# Метод відображає теперішній стан гри
# Відображає кількість помилок і неправильні літери
# Відображає кількість спроб, які залишилися
# Якщо помилок > 7 - повідомити про кінець гри
# Якщо усі літери відгадані - повідомити про перемогу

def show_Status (mystery_word, good_letters, bad_letters, errors_count)

	puts "Гра \"Вгадай слово\" v1.0"
	puts "\n"

	puts "Слово: " + get_Word_For_Print(mystery_word, good_letters)

	if (mystery_word.uniq.size == good_letters.size)
		puts "\n"
		abort "Ви вгадали слово. Вітаємо!"
	elsif (errors_count >= 7)
		puts "\n"
		abort "Слово не було відгадане. Ви програли :("
	end

	wrong_letters = ""
	if (errors_count > 0) 
		wrong_letters = ": [#{bad_letters.join(", ")}]"
	end

	puts "\n"
	puts "Кількість помилок #{errors_count}#{wrong_letters}"
	puts "У вас залишилося спроб: " + (7 - errors_count).to_s

end

# Метод отримує та перевіряє текст, який ввів користувач

def get_User_Input()

  puts "\n"
  puts "Введіть наступну літеру"

  letter = ""

  while (letter == "" or letter == " " or letter.length > 1) do
    letter = STDIN.gets.encode("UTF-8").chomp
  end

  return letter.downcase

end

# Метод перевіряє чи користувач вгадав літеру
# Метод <qnic> повертає масив з елементами у якому немає повторень

def check_Letter (letter, mystery_word, good_letters, bad_letters)

	if (good_letters.include?(letter) ||
		bad_letters.include?(letter))
		return 0
	end

	if (mystery_word.uniq.include?(letter))
		good_letters << letter
	else
		bad_letters << letter
		return -1
	end

	if (mystery_word.uniq.size == good_letters.size)
		return 1
	else
		return 0
	end

end