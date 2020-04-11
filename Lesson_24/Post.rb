require "fileutils"
require "sqlite3"

class Post

# Статична перемінна класу, яка містить шлях до бази даних

@@SQLITE_DB_FILE = File.dirname(__FILE__) + "/data/notepad.sqlite3"

# Конструктор

def initialize()

	@text = nil
	@created_at = Time.now

end

# Статичний метод, який створює екземпляр відповідного дочірнього класу

def self.create (type)

	return post_Types[type].new

end

# Статичний метод, який повертає варіанти записів

def self.post_Types()

	return { "Memo" => Memo,
			 "Link" => Link,
			 "Task" => Task }

end

# Подання даних у вигляді строки

def to_String()
	# todo
end

# Отримання даних від користувача

def read_From_Console()
	#todo
end

# Пошук записів у базі даних

def self.find_Data (limit, type, id)

	db = SQLite3::Database.open(@@SQLITE_DB_FILE)

	# Відображаємо дані по ідентифікатору
	if id != nil

		# Отримувати результати у вигляді хешів
		db.results_as_hash = true

		# Виконуємо запит, отримуємо масив результатів
		result = db.execute("SELECT * FROM posts WHERE rowid = ?", id)

		# Результат - перший елемент (якщо повернувся масив)
		result = result[0] if result.is_a? Array

		# Закриваємо базу даних
		db.close

		# Якщо результат порожній - запис не знайдено
		if result == nil

			puts "Запис із даним id (#{id}) відсутній у базі даних"
    		exit

		# Якщо результат не порожній - запис знайдено
		else

    		# Створюємо екземпляр класу <Post> заданого типу
    		post = create(result['type'])

    		# Заповнюємо екземпляр класу даними
    		post.load_Data(result)

    		# Повертаємо результат
    		return post

		end

	# Відображаємо дані у вигляді таблиці
	else

		# Заборонити отримувати результати у вигляді хешів
  		db.results_as_hash = false

		# Формуємо запит до бази даних із необхідними умовами
		query = "SELECT rowid, * FROM posts "

		# Якщо заданий тип, необхідно додати дану умову
		query += "WHERE type = :type " unless type.nil?

		# Сортування записів по id - спочатку будуть відображатися найновіші
		query += "ORDER by rowid DESC "

		# Якщо заданий ліміт, необхідно додати дану умову
		query += "LIMIT :limit " unless limit.nil?

  		# Готуємо запит до бази даних
  		statement = db.prepare query

  		# Вставляємо значення параметрів, якщо вони є
  		statement.bind_param('type', type) unless type.nil?
  		statement.bind_param('limit', limit) unless limit.nil?

  		# Виконуємо запит, отримуємо результат
		result = statement.execute!

		# Закриваємо запит і базу даних
		statement.close
		db.close

		# Повертаємо результат
		return result

	end

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
		"created_at" => @created_at.strftime("%Y-%m-%d %H:%M:%S")

	}

end

# Завантажуємо свої поля з хеш-масиву

def load_Data (data_hash)

	@created_at = Time.parse(data_hash['created_at'])
	@text = data_hash['text']

end

# Кінець класу <Post>

end