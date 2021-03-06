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

# Метод повертає дані класу у вигляді хешу

def to_DB_Hash

	return super.merge(

		{

			"text" => @text.join('\n')

		}

	)

end

# Завантажуємо свої поля з хеш-масиву

def load_Data (data_hash)

	super(data_hash) # Викликаємо батьківський метод

	@text = data_hash['text'].split('\n')

end

# Кінець класу <Memo>

end