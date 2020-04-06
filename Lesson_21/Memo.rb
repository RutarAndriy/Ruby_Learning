class Memo < Post

# Подання даних у вигляді строки

def to_String()

	time_string = "Створено #{@created_at.strftime("%d.%m.%Y, %H:%M:%S")}\n\n"

	return @text.unshift(time_string)

end

# Отримання даних від користувача

def read_From_Console()

	puts "Нова замітка (весь текст до строки \"end\"):"

	line = nil
	@text = []

	while line != "end" do
		line = STDIN.gets.chomp
		@text << line		
	end

	@text.pop()

end

# Кінець класу <Memo>

end