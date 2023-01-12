class Station
	attr_accessor :name, :trains

	def initialize(name)
		@name = name
		@trains = []
	end

	def add_train(train)
		add_train!(train)
	end
	def output_trains
		output_trains!
	end
	def trains_by_type(type)
		trains_by_type!(type)
	end
	def train_dispatch(train)
		train_dispatch!(train)
	end
	#Нет наследования.
	#Ниже перечисленные методы не должны вызываться из клиентского кода
	private

    #Может принимать поезда (по одному за раз)	
	def add_train!(train)
		@trains.push(train)
		puts "поезд #{train.number} принят"
	end
	
	# Может возвращать список всех поездов на станции, находящиеся в текущий момент
	def output_trains!
		@trains.each {|train| puts train.number}
	end
	
	# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
	def trains_by_type!(type)
		@trains.each {|train| puts "На станции находятся #{train.number} поезд(а)" if type == type} 
	end

	# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции
	def train_dispatch!(train)
		@trains.delete(train) if trains.include?(train)
		puts "Отправляется поезд #{train.number}"
	end
end