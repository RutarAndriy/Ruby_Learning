require_relative 'Post.rb'

require_relative 'Memo.rb'
require_relative 'Link.rb'
require_relative 'Task.rb'

require 'optparse' # Бібліотека для обробки опцій

options = {} # Масив опцій

desc_id    = "show post with this POST_ID"
desc_type  = "show all posts with this POST_TYPE"
desc_limit = "show last NUMBER posts"

# Використовуємо парсер опцій

OptionParser.new do |option|
    
    # Заголовок вікна допомоги
    option.banner = 'Usage: Viewer.rb [options]'

    # Якщо ввели команду <-h> - відображаємо текст допомоги
    option.on('-h', 'prints this help') do
        puts option
        exit
    end

    # Усі доступні ключі опцій
    option.on("--id POST_ID",     desc_id)    { |o| options[:id]    = o }
    option.on("--type POST_TYPE", desc_type)  { |o| options[:type]  = o }
    option.on("--limit NUMBER",   desc_limit) { |o| options[:limit] = o }

end.parse!

# Отримуємо результат пошуку за запитом
result = Post.find_Data(options[:limit], options[:type], options[:id])

# Відображаємо конкретний запис

if result.is_a? Post

    # Відображаємо інформаційний заголовок
    puts "Запис #{result.class.name}, id = #{options[:id]}"

    # Відображаємо запис
    result.to_String.each do |line|
        puts line
    end

# Відображаємо таблицю результатів

else

    # Відображаємо шапку таблиці
    puts "\n"
    print "|  id\t|  type\t|\tcreated_at\t|\t\ttext\n"
    print '-' * 80

    # Відображаємо вміст таблиці
    result.each do |row|

        puts "\n"

        (0..3).each do |element|

            if element == 3 && row[3].to_s.size >= 38
                print "|  #{row[element].to_s.gsub("\\n", " ")[0..33]}..."
            else
                print "|  #{row[element].to_s.gsub("\\n", " ")}\t"
            end
        
        end

    end

    puts "\n\n"

end