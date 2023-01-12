class Route
	attr_reader :stations, :first_station, :last_station

	def initialize(first_station, last_station)
		@stations = [first_station, last_station]
	end

	def add_station(station)
		add_station!(station)
	end

	def delete_station(station)
		delete_station!(station)
	end
	def all_stations
		all_stations!
	end
    
    #Ниже перечисленные методы не должны вызываться из клиентского кода, не входят в интерфейс класса.
	private

	#Может добавлять промежуточную станцию в список
	def add_station!(station)
		@stations.insert(-2,station)
		puts "станция #{station.name} добавлена"
	end

	#Может удалять промежуточную станцию из списка
	def delete_station!(station)
		if (station == first_station) || (stations == last_station)
			puts "Удаление начальной и конечной станции запрещено"
		else
			@stations.delete(station)
			puts "станция #{station.name} удалена из маршрута"
		end
	end

	#Может выводить список всех станций по-порядку от начальной до конечной
	def all_stations!
		@stations.each {|station| puts station.name}
	end
end