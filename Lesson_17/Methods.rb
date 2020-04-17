# Підключаємо бібліотеку для роботи із протоколом HTTP
require "net/http"

# Метод <word_exits?> перевіряє, чи є стаття у Вікіпедії про введене слово

def word_Exists? (word)

	# Формуємо адрес сторінки для перевірки
	url = "https://en.wiktionary.org/wiki/#{word}"

	# Отримуємо вміст сторінки і записуємо його у перемінну
	wiki_page = Net::HTTP.get(URI.parse(URI.encode(url))).force_encoding('UTF-8')

	# Перевірка наявності статті за заданим словом
	if wiki_page =~ /<span class="toctext">English<\/span>/
		return true
	else
		return false
	end

end

# Метод, який формує строку-шаблон

def random_Regexp_String

	# Масив патернів
	patterns = ["dog", "like", "home", "milk", "gem", "cut", "boy"]

	# Вибираємо випадковий патерн
	pattern = patterns.sample

	# Замінюємо дві випадкові літери в патерні
	letter = pattern.split('').sample
	pattern = pattern.gsub(letter, '.')

	letter = pattern.split('').sample
	pattern = pattern.gsub(letter, '.')

	# Повертаємо результат
	return pattern.gsub(letter, '.')

end