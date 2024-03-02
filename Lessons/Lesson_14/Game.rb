current_path = File.dirname(__FILE__)

require "#{current_path}/Game_core.rb"
require "#{current_path}/Word_reader.rb"
require "#{current_path}/Print_result.rb"

reader = Word_reader.new
printer = Print_result.new(reader, current_path)

word = reader.read_Lines_From_File("#{current_path}/text/words.txt").sample.chomp

# Основний код гри

core = Game_core.new(word)

while core.errors_count <= 7 do

	printer.show_Status(core)
	core.ask_Next_Letter()

end

printer.show_Status(core)