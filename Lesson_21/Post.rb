require "fileutils"

class Post

# Статичний метод, який повертає варіанти записів

def self.post_Types()

	return [Memo, Link, Task]

end

# Статичний метод, який створює екземпляр відповідного дочірнього класу

def self.create (type_index)

	return post_Types[type_index].new

end

# Конструктор

def initialize()

	@text = nil
	@created_at = Time.now

end

# Подання даних у вигляді строки

def to_String()
	# todo
end

# Отримання даних від користувача

def read_From_Console()
	#todo
end

# Записати дані у файл

def write_File()

	file = File.new(get_File_Path, "w:UTF-8")

	for line in to_String() do
		file.puts(line)
	end

	file.close()

end

# Отримати шлях до файлу

def get_File_Path()

	current_path = File.dirname(__FILE__) + "/notes"

	FileUtils.mkdir_p current_path

	file_name = @created_at.strftime("#{self.class.name}_%d-%m-%Y_%H-%M-%S.txt")

	return current_path + "/" + file_name

end

# Кінець класу <Post>

end