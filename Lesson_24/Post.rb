require "fileutils"
require "sqlite3"

class Post

# Статична перемінна класу, яка містить шлях до бази даних

@@SQLITE_DB_FILE = File.dirname(__FILE__) + "/data/notepad.sqlite3"

# Статичний метод, який повертає варіанти записів

def self.post_Types()

	return { "Memo" => Memo,
			 "Link" => Link,
			 "Task" => Task }

end

# Статичний метод, який створює екземпляр відповідного дочірнього класу

def self.create (type)

	return post_Types[type].new

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

# Збереження даних у базу даних

def save_To_DB()

	db = SQLite3::Database.open(@@SQLITE_DB_FILE)
	db.results_as_hash = true

	db.execute(

		# Вставка до таблиці <posts> ключів ...
		"INSERT INTO posts (#{to_DB_Hash.keys.join(",")}) " +

		# ... із наступними значеннями <?1, ?2, ... ?n>
		"VALUES (#{('?,' * to_DB_Hash.keys.size).chomp(',')})",

		# Значення для вставки замість плейсхолдерів (?1, ?2, ... ?n)
		to_DB_Hash.values)

	insert_row_id = db.last_insert_row_id

	db.close

	return insert_row_id

end

# Метод повертає дані класу у вигляді хешу

def to_DB_Hash

	return {

		"type" => self.class.name,
		"created_at" => @created_at.to_s

	}

end

# Кінець класу <Post>

end