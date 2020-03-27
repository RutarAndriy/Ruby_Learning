require "./Game_core.rb"
require "./Print_result_v1.rb"
require "./Print_result_v2.rb"

word = ARGV[0]

# Вибір класу - "відображувача"

if (ARGV[1] != nil && ARGV[1] == "-v2")
	printer = Print_result_v2.new
else
	printer = Print_result_v1.new
end

# Виправлення помилок кодування на Windows

if (Gem.win_platform? && ARGV[0])
	word = result.encode(ARVG[0].encoding, "cp1251").encode("UTF-8")
end

# Основний код гри

core = Game_core.new(word)

while core.errors_count <= 7 do

	printer.show_Status(core)
	core.ask_Next_Letter()

end

printer.show_Status(core)