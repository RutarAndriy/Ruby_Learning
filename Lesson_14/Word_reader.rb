class Word_reader

# Читання файлу повністю

def read_Text_From_File (file_name)

	if File.exist?(file_name)

		file = File.new(file_name, "r:UTF-8")
		text = file.read()
		file.close()

		return text.chomp

	else

		return nil
		
	end

end

# Читання файлу постоково

def read_Lines_From_File (file_name)

	if File.exist?(file_name)

		file = File.new(file_name, "r:UTF-8")
		lines = file.readlines
		file.close()

		return lines

	else

		return nil
		
	end

end

# Кінець класу <Word_reader>

end