count = 1

# Цикл <while>

while count <= 5 do

	puts count
	count += 1
	sleep 0.5

end


# 0 - ціле яйце, 1 - розбите яйце

eggs = [0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0]

# Масив нерозбитих яєць

good_eggs = []

# Кількість розбитих яєць

broken_count = 0;

# Цикл <for>

for item in eggs do

	if (item != 0)
		broken_count += 1
	else
		good_eggs << item
	end

end

puts "Масив нерозбитих яєць: " + good_eggs.to_s
puts "Кількість розбитих яєць: " + broken_count.to_s
puts "\n"

# Пісенька про Олю :)

names = []
user_input = nil

while user_input != "" do

	puts "Як тебе звати?"
	user_input = gets.encode("UTF-8").chomp
	names << user_input
	
end

for item in names do

	puts "З нами " + item
	sleep 1

	if (item == "Оля")
		puts "Оля? Хто така Оля?"
		sleep 1
		break
	end

end

puts "І що це є за дівчинка і де вона живе?"
sleep 1
puts "А може вона не курить, а може вона не п'є?"
sleep 1
puts "А ми компанією цілою візьмемо і прийдем до Олі... :)"