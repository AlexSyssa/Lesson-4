train_cargo1 = CargoTrain.new(248, 'Cargo')
train_passenger1 = PassengerTrain.new(250, 'Passenger')
station1 = Station.new("Удмурская")
station2 = Station.new("Вахская")
station3 = Station.new("Пионерская")
station4 = Station.new("Советская")
route1 = Route.new(station1, station2)
route2 = Route.new(station3, station4)
cargo_wagon1 = CargoWagon.new(11)
cargo_wagon2 = CargoWagon.new(33)
cargo_wagon3 = CargoWagon.new(55)
cargo_wagon4 = CargoWagon.new(77)
passenger_wagon1 = PassengerWagon.new(22)
passenger_wagon2 = PassengerWagon.new(44)
passenger_wagon3 = PassengerWagon.new(66)
passenger_wagon4 = PassengerWagon.new(88)

route1.add_station(station4)
route1.add_station(station3)
route1.delete_station(station3)
route1.all_stations



train_cargo1.speed_up(10)
train_cargo1.stop
train_cargo1.speed_up(10)
train_cargo1.speed
train_cargo1.add_wagon(cargo_wagon1)
train_cargo1.delete_wagon(cargo_wagon1)
#не работает
train_cargo1.take_route(route1)



station1.trains_by_type('cargo')

station1.add_train(train_cargo1)
station1.train_dispatch(train_cargo1)
# no
station1.output_trains



def new train
		puts "Введите номер поезда"
	 	number = gets.chomp.to_i
	 	puts "Выберите тип поезда, 1 - Пассажирский, 2 - Грузовой"
	 	type = gets.chomp.to_i
	 	if type == 1 
	 		ptrain_passenger1 = PassengerTrain.new(number, 'Passenger')
	 		puts "Пассажирский поезд № #{number} создан"
	 	else
	 		train_cargo1 = CargoTrain.new(number, 'Cargo')
	 		puts "Грузовой поезд № #{number} создан"
	 	end
	when 3
	 	puts "Укажите первую станцию маршрута"
	 	first_station1 = gets.chomp
	 	first_station = Station.new(first_station1)
	 	puts "Укажите последнюю станцию маршрута"
	 	last_station1 = gets.chomp
	 	last_station = Station.new(first_station1)
	 	route1 = Route.new(first_station, last_station)
	 	puts "Если вы желаете добавить промежуточную станцию введите 1, если вы хотите удалить станцию введите 2"
	 	choice2 = gets.chomp.to_i
	 	if choice2 == 1
	 		puts "Введите наименование промежуточной станции"
	 		name = gets.chomp
	 		route1.add_station(name)
	 	else
	 		route1.delete_station
	 	end
	 	puts "Маршрут создан"
	when 4 
	 	train1.take_route(route1)
	 	puts "Маршрут назначен поезду"
	when 5 
	 	train1.add_wagon
	when 6
	 	train1.delete_wagon
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



