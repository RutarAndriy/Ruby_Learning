class Print_result

# Конструктор

def initialize (reader, path)

	@you_win = reader.read_Text_From_File("#{path}/text/you_win.txt")
	@game_over = reader.read_Text_From_File("#{path}/text/game_over.txt")

	@errors = []
	counter = 0

	while counter < 7 do

		@errors << reader.read_Text_From_File("#{path}/text/errors_#{counter}.txt")
		counter += 1

	end

end

# Метод відображає статус гри
# Написи згенеровані за допомогою сайту http://www.network-science.de/ascii/

def show_Status (core)

	clear()
	puts "Гра \"Вгадай слово\" v3.0"
	puts "\n"

	puts "Слово: " + get_Word_For_Print(core.mystery_word, core.good_letters)

	if (core.mystery_word.uniq.size == core.good_letters.size)
		abort "\n#{@you_win}\n\n"

	elsif (core.errors_count >= 7)
		abort "\n#{@game_over}\n\n"
	end

	wrong_letters = ""
	if (core.errors_count > 0) 
		wrong_letters = ": [#{core.bad_letters.join(", ")}]"
	end

	show_Errors_Count(core)

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

# Метод відображає кількість помилок

def show_Errors_Count (core)

	puts "\n#{@errors[core.errors_count]}"

end

# Кінець класу <Print_result>

end