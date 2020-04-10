require "date"

class Task < Post

# Конструктор

def initialize()

	super
	@due_date = Time.now

end

# Подання даних у вигляді строки

def to_String()

	time_string = "Створено #{@created_at.strftime("%d.%m.%Y, %H:%M:%S")}\n\n"

	deadline = "Крайній термін: #{@due_date}"

	return [time_string, @text, deadline]

end

# Отримання даних від користувача

def read_From_Console()

	puts "Що потрібно зробити?"
	@text = STDIN.gets.chomp

	puts "До якого числа? Вкажіть дату у форматі ДД.ММ.РРРР, наприклад 25.04.1995"
	input = STDIN.gets.chomp

	@due_date = Date.parse(input)

end

# Метод повертає дані класу у вигляді хешу

def to_DB_Hash

	return super.merge(

		{

			"text" => @text,
			"due_date" => @due_date.to_s

		}

	)

end

# Кінець класу <Task>

end