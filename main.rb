require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Main

	MENU = [
		{ id:0, title: 'Выйти из приложения', action: :exit },
		{ id:1, title: 'Создать станцию"', action: :new_station },
		{ id:2, title: 'Создать поезд', action: :new_train },
		{ id:3, title: 'Создать маршрут', action: :new_route },
		{ id:4, title: 'Добавить станцию в маршрут', action: :add_station },
		{ id:5, title: 'Удалить станцию из маршрута', action: :delete_station },
		{ id:6, title: 'Назначить маршрут поезду', action: :set_route },
		{ id:7, title: 'Прицепить вагон к поезду', action: :set_wagon },
		{ id:8, title: 'Отцепить вагон от поезда', action: :delete_wagon },
		{ id:9, title: 'Переместить поезд по маршруту вперед', action: :next_station },
		{ id:10, title: 'Переместить поезд по маршруту назад', action: :previous_station },
		{ id:11, title: 'Просмотреть список станций на маршруте', action: :list_stations },
		{ id:12, title: 'Просмотреть список поездов на станции', action: :list_trains },
	].freeze

	attr_accessor :route1, :medium_station, :name_medium_station, :first_station, :last_station, :train, :train_cargo1
  attr_accessor :number_trains, :number_train, :wagon, :wagons
	def initialize
		@all_stations = []
		@trains = []
		@routes = []
		@route1 = route1
		@medium_station = medium_station
		@name_medium_station = name_medium_station
		@first_station = first_station
		@last_station = last_station
		@train_cargo1 = train_cargo1
		@id_trains = []
		
	end

	def start_menu
		puts ""
		puts ""
		puts "Меню:"
		MENU.each do |item|
			puts "#{item[:id]} - #{item[:title]}"
		end
	end

	def program
		loop do
			start_menu
			puts "Выберите необходимое действие и введите соответствующую цифру: "

			choice = gets.chomp.to_i
			break if choice.zero?

			puts 
			send(MENU[choice][:action])
		end
	end

	def new_station
		puts "Введите наименование станции"
	 	name = gets.chomp
	 	station1 = Station.new(name)
	 	puts "Станция #{name} успешно создана"
	 	@all_stations << station1
	end

	def new_train
		puts "Введите номер поезда"
	 	id = gets.chomp.to_i
	 	@id_trains << id
	 	puts "Выберите тип поезда, 1 - Пассажирский, 2 - Грузовой"
	 	type = gets.chomp.to_i
	 	if type == 1 
	 		train = PassengerTrain.new(id, 'Passenger')
	 		puts "Пассажирский поезд № #{id} создан"
	 		@trains << train
	 	else
	 		train = CargoTrain.new(id, 'Cargo')
	 		puts "Грузовой поезд № #{id} создан"
	 		@trains << train
	 	end
	end
	
	def new_route
	 	puts "Укажите первую станцию маршрута"
	 	first_station1 = gets.chomp
	 	first_station = Station.new(first_station1)
	 	@all_stations << first_station
	 	puts "Укажите последнюю станцию маршрута"
	 	last_station1 = gets.chomp
	 	last_station = Station.new(last_station1)
	 	@all_stations << last_station
	 	@route1 = Route.new(first_station, last_station)
	 	puts "Маршрут создан. Начальная станция маршрута - #{first_station1}, конечная станция маршрута #{last_station1}"
	end

	def add_station
		puts "Введите наименование промежуточной станции"
	  name_medium_station = gets.chomp
	 	medium_station =  Station.new(name_medium_station)
	 	@all_stations << medium_station
	 	route1.add_station(medium_station)
	end

	def delete_station
		route1.delete_station(medium_station)
	end
	def set_route
		puts "Введите номер поезда"
		id = gets.chomp.to_i
		if @id_trains.include?(id)
			puts "Введитете наименование первой станции"
			first_station2 = gets.chomp
	 	  first_station = Station.new(first_station2)
	 	  puts "Введитете наименование конечной станции"
	 	  last_station2 = gets.chomp
	 	  last_station = Station.new(first_station2)
	 	  route1 = Route.new(first_station, last_station)
	 	  @route = route1
	 	  @current_station_index = 0
		  puts "Поезду № #{id} назначен маршрут. Начальная станция маршрута - #{first_station2}, конечная станция маршрута #{last_station2}"
	 	else
	 		puts"Поезда с данным номером не существует. Перед назначением маршрута необходимо создать поезд."
	 	end
	end
	def set_wagon
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		puts 'Введите тип вагона 1 - пассажирский, 2 - грузовой'
		wagon_type = gets.chomp.to_i
		puts "Введите номер поезда, к которому необходимо прицепить вагон"
		id = gets.chomp.to_i
		case wagon_type
		when 1
			wagon = PassengerWagon.new(number)
			train = PassengerTrain.new(id, 'Passenger')
		when 2
			wagon = CargoWagon.new(number)
			train = CargoTrain.new(id, 'Cargo')
		end
		train.add_wagon(wagon)
		puts " Вагон № #{number} прицеплен к поезду № #{id}"

	end
	def delete_wagon
		puts "Введите номер поезда"
		id = gets.chomp.to_i
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		train.delete_wagon(wagon)
	end

	def next_station
		train.next_station
	end

	def previous_station
		train.previous_station
	end

	def list_stations
		@all_stations.each {|station| puts station.name}
	end

	def list_trains
		@id_trains.each {|id| puts id}
	end


end

Main.new.program



	 	






