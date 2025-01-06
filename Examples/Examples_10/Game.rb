# Дозволяємо використання методів із файлу <Methods.rb>
require "./Methods.rb"

# Отримуємо масив із загаданого слова
mystery_word = get_Mystery_Word()

# Визначаємо необхідні перемінніні

errors_count = 0

good_letters = []
bad_letters = []

# Основний цикл програми

while errors_count < 7 do
	
	clear()

	show_Status(mystery_word, good_letters, bad_letters, errors_count)

	letter = get_User_Input()

	result = check_Letter(letter, mystery_word, good_letters, bad_letters)

	if (result == -1)
		errors_count += 1
	elsif (result == 1)
		break
	end

end

# Гра завершена - відображаємо результат

clear
show_Status(mystery_word, good_letters, bad_letters, errors_count)