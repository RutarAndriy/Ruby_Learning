class Task < Post

# Конструктор

def initialize()

	super

	@due_date = Time.now

end

# Подання даних у вигляді строки

def to_String()
	# todo
end

# Отримання даних від користувача

def read_From_Console()
	#todo
end

end