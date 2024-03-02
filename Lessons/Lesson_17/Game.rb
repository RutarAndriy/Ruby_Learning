# Гра "Вгадай слово по шаблону"
# Хороший приклад використання регулярних виразів

# Цей код необхідний лише при використанні кирилиці на Windows

if Gem.win_platform?

    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__

    [STDIN, STDOUT].each do |io|
        io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end

end

# Підключаємо додатковий файл із необхідними нам методами
require_relative "Methods"

# Отримуємо випадковий шаблон слова
regexp_string = random_Regexp_String()

# Виводимо гравцеві правила гри і розповідаємо, як закінчити гру
# За допомогою методу <gsub> замінюємо <.> у регулярному виразі на <*>

puts "Придумайте якомога більше слів, які містять шаблон:"
puts
puts regexp_string.gsub('.', '*')
puts
puts "Для виходу введіть \"X\""
puts

# Перемінна зберігає кількість вгаданих існуючих слів
count = 0

# Основний цикл гри

loop do

    # Запитуємо слово у гравця
    word = STDIN.gets.chomp

    # Якщо гравець ввів X або x — виходимо із циклу
    if word.downcase == 'x'
        break
    end

    # Перевірка, чи підходить введено слово під шаблон
    if word =~ /#{regexp_string}/

        # Перевірка, чи введене слово існує
        if word_Exists?(word)
            # Якщо слово існує, гравцю зараховується бал
            puts ".. OK =)"
            count += 1
        else
            # Якщо не існує - бал не зараховується
            puts ".. Вікіпедія нічого не знає про слово \"#{word}\" :("
        end

    else
        # Слово не підходить під шаблон
        puts "Слово не підходить під заданий шаблон"
    end
end

# Виводимо гравцеві його рахунок
puts "Гра завершена, ваш рахунок: #{count}"