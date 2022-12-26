require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

loop do 
	puts "Выберите пункт интерфейса:"
	puts "1 - Создать станцию"
	puts "2 - Создать поезд"
	puts "3 - Создать маршрут и управлять станциями в нем (добавлять, удалять)"
	puts "4 - Назначить маршрут поезду"
	puts "5 - Добавить вагон к поезду"
	puts "6 - Отцепить вагон от поезда"
	puts "7 - Переместить поезд по маршруту вперед"
	puts "8 - Переместить поезд по маршруту назад"
	puts "9 - Просмотреть список станций"
	puts "10 - Просмотреть список поездов на станции"
	puts "0 - Выйти"

	choice = gets.chomp.to_i

	case choice
	when 1
		puts "Введите наименование станции"
	 	name_station = gets.chomp
	 	station1 = Station.new(name_station)
	when 2
		puts "Введите номер поезда"
	 	number = gets.chomp.to_i
	 	puts "Выберите тип поезда, 1 - Пассажирский, 2 - Грузовой"
	 	type = gets.chomp.to_i
	 	if type == 1 
	 		train1 = PassengerTrain.new(number)
	 	else
	 		train1 = CargoTrain.new(number)
	 	end
	when 3
	 	puts "Укажите первую станцию маршрута"
	 	first_station = gets.chomp
	 	puts "Укажите последнюю станцию маршрута"
	 	last_station = gets.chomp
	 	route1 = Route.new(first_station, last_station)
	 	puts "Если вы желаете добавить промежуточную станцию введите 1, если вы хотите удалить станцию введите 2"
	 	choice2 = gets.chomp.to_i
	 	if choice2 == 1
	 		puts "Введите наименование промежуточной станции"
	 		station_name = gets.chomp
	 		route1.add_station(station_name)
	 	else
	 		route1.delete_stations
	 	end
	when 4 
	 	train1.getting_route(route1)
	when 5 
	 	train1.add_carriage
	when 6
	 	train1.delete_carriage
	when 7 
	 	train1.next_station
	when 8
	 	train1.previous_station
	when 9
	 	route1.all_stations
	when 10
	 	station1.output_trains
	when 0
	 	break
	end
end






