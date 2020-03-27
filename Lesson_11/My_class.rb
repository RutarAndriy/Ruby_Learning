class My_class

# Метод ініціалізації класу (конструктор)
# Перемінні, які починаються із знаку @ - перемінні стану класу

def initialize()
	puts "Створення нового екземпляру класу"
	@method_use = false
end

# Власний метод <my_Methos> класу <My_class>

def my_Method()
	puts "Виклик методу \"my_Method\""
	@method_use = true
end

# Перевірка стану класу
# Для методів, які повертають булеві значення, використовують ? в кінці назви методу

def is_My_Method_Use?
	return @method_use
end

end