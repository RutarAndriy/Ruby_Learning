require_relative "Post.rb"

require_relative "Memo.rb"
require_relative "Link.rb"
require_relative "Task.rb"

puts "Записник v1.0"
puts "Що ви хочете записати?"
puts "\n"

# Варіанти записів

choices = Post.post_Types
choice = -1

# Цикл вибору варіанту запису

until choice >= 0 && choice < choices.size
	
	choices.each_with_index do |type, index|
		puts "#{index}. #{type}"
	end

	puts "\n"

	choice = STDIN.gets.chomp.to_i

end

puts "\n"

# Створення екземпляру відповідного класу

entry = Post.create(choice)

# Читання та запис даних

entry.read_From_Console()
entry.write_File()

puts "\n"
puts "Запис успішно збережено"