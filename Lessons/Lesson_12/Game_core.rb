class Game_core

# Конструктор

def initialize (word)

	@mystery_word = get_Mystery_Word(word)
	@errors_count = 0

	@good_letters = []
	@bad_letters = []

	@status = 0

end

# Отримуємо із загаданого слова масив літер

def get_Mystery_Word (word)

	if (word == nil or word == "")
		abort "Щоб почати гру введіть загадане слово у якості аргумента при запуску програми"
	end

	word = word.downcase

	return word.split("")

end

# Запитуємо у користувача наступну літеру

def ask_Next_Letter()

	puts "\n"
	puts "Введіть наступну літеру"

	letter = ""

	while (letter == "" or letter == " " or letter.length > 1) do
		letter = STDIN.gets.encode("UTF-8").chomp
	end

	letter = letter.downcase
	@status = check_Letter(letter)

end

# Перевірка наявності літери у загаданому слові

def check_Letter (letter)

	if (@good_letters.include?(letter) ||
		@bad_letters.include?(letter))
		return 0
	elsif (@mystery_word.uniq.include?(letter))
		@good_letters << letter
		return 0
	end

	if (@mystery_word.uniq.size == @good_letters.size)
		return 1
	else
		@bad_letters << letter
		@errors_count += 1
		if @errors_count >= 7
			return -1
		end
	end

	return 0

end

# Методи для отримання внутрішніх перемінних класу
# Якщо в методі лише одна перемінна, то це рівноцінно команді return

def mystery_word
	@mystery_word
end

def errors_count
	@errors_count
end

def good_letters
	@good_letters
end

def bad_letters
	@bad_letters
end

def status
	@status
end

# Кінець класу <Game_core>

end