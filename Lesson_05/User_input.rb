puts "Привіт, як тебе звати?"

# Метод <encode> перетворює строку у заданий формат
# Метод <chomp> видаляє пробіли та переноси в кінці строки

name = gets.encode("UTF-8").chomp

# Команда <abort> виводить повідомлення
# і достроково завершує програму

abort "Привіт, " + name + ", як у тебе справи?"