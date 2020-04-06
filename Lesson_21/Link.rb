class Link < Post

# Конструктор

def initialize()

	super
	@url = ""

end

# Подання даних у вигляді строки

def to_String()

	time_string = "Створено #{@created_at.strftime("%d.%m.%Y, %H:%M:%S")}\n\n"

	return [time_string, @url, @text]

end

# Отримання даних від користувача

def read_From_Console()

	puts "Адреса посилання:"
	@url = STDIN.gets.chomp

	puts "Опис посилання:"
	@text = STDIN.gets.chomp

end

# Кінець класу <Link>

end