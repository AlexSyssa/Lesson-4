class Route
	attr_reader :route

	def initialize(first_station, last_station)
		@route = [first_station, last_station]
	end

	def add_station(station)
		add_station!(station)
	end

	def delete_stations(station)
		delete_stations!(station)
	end
	def all_stations
		all_stations!
	end

    #
    #Ниже перечисленные методы не должны вызываться из клиентского кода, не входят в интерфейс класса.
	private


	#Может добавлять промежуточную станцию в список
	def add_station!(station)
		@route.insert(-2,station)
		puts "станция #{station} добавлена"
	end

	#Может удалять промежуточную станцию из списка
	def delete_stations!
		@route.delete_at(-2)
		puts "станция #{route[-2]} удалена из списка"
	end

	#Может выводить список всех станций по-порядку от начальной до конечной
	def all_stations!
		@route.each {|station| puts station}
	end
end