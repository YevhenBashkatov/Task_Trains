# require_relative 'AbstractTrain'
# require_relative 'AbstractCarrige'
# require_relative 'PassengerTrain'
# require_relative 'PassengerCarrige'
# require_relative 'CargoTrain'
# require_relative 'CargoCarrige'
# require_relative 'Station'
# require_relative 'Route'
#
#
# class Controller
#
#   attr_reader :stations, :trains, :route, :train_carriges, :instances
#
#   def create_train(number,type)
#     type == "passenger" ? PassengerTrain.new(number) : CargoTrain.new(number)
#   end
#   def create_station(station_name)
#     Station.new(station_name)
#   end
#   def find_station(station_name)
#     Station.find(station_name)
#   end
#
#   def find_train(train_number)
#     AbstractTrain.find(train_number)
#   end
#   def add_carrige(train_number,carrige_number)
#
#     find_train(train_number).add_carrige(PassengerCarrige.new(carrige_number))
#   end
#
#
#
#
#
# end
