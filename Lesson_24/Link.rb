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

# Метод повертає дані класу у вигляді хешу

def to_DB_Hash

	return super.merge(

		{

			"text" => @text,
			"url" => @url

		}

	)

end

# Завантажуємо свої поля з хеш-масиву

def load_Data (data_hash)

	super(data_hash) # Викликаємо батьківський метод

	@url = data_hash['url']

end

# Кінець класу <Link>

end