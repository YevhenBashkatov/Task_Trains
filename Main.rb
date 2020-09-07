require_relative 'AbstractTrain'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
require_relative 'CargoCarrige'
require_relative 'Route'
require_relative 'Station'
require_relative 'Controller'

=begin
def invitation
  puts " 0: Exit \n 1: Create train\n 2: Create station\n 3: Add carrige\n 4: Remove carrige\n 5: Set train on station\n 6:Show list of stations and trains"
end

puts "Hi, mate, lest start working \n What do you want to do?"
invitation
train_number_user = 0
train_type_user = 0
def create_train(train_number_user,train_type_user)
  if train_type_user == "passenger"
      PassengerTrain.new(train_number_user)
  else
    CargoTrain.new(train_number_user)
  end
end

def show_passenger_trains
   PassengerTrain.all.each_pair { |key,value | puts "N.o Train:" + key.to_s + " "+ " carriges:" + value.train_carriges.to_s}
end

def show_trains
  AbstractTrain.all.each_pair { |key,value | puts "N.o Train:" + key.to_s + " "+ " carriges:" + value.train_carriges.to_s}
end

def show_cargo_trains
  puts CargoTrain.all.each_pair { |key,value | puts "N.o Train:" + key.to_s + " "+ " carriges:" + value.train_carriges.to_s}
end

def add_carrige(train_number_user,carrige_name_user)
  AbstractTrain.find(train_number_user).train_type == :passenger ? AbstractTrain.find(train_number_user).add_carrige(PassengerCarrige.new(carrige_name_user))
      : AbstractTrain.find(train_number_user).add_carrige(CargoCarrige.new(carrige_name_user))

end



option = nil
while option != 0
  option = gets.chomp!.to_i

case option
  when 1
    puts "Please, set the number of train: "
    train_number_user = gets.chomp!
    puts "and type (passenger or cargo): "
    train_type_user = gets.chomp!
    puts "Train #{train_number_user} created!"
    create_train(train_number_user,train_type_user)

    show_passenger_trains
    invitation
  when 2
    puts "Please, set name of station:"
    station_name_user = gets.chomp!.to_s
    Station.new(station_name_user)
    puts "Station #{station_name_user} created!"
    invitation
  when 3
    puts "Please, set number of carrige"
    carrige_name_user = gets.chomp!.to_s
    puts "in what train?:"
    show_trains
    train_number_user = gets.chomp!
    add_carrige(train_number_user,carrige_name_user)
    puts "Carrige added!"
    invitation
  when 4
    puts "Select train type:"
    train_type_user = gets.chomp!
    train_type_user == :passenger ? show_passenger_trains : show_cargo_trains
    puts "Select train:"
    train_number_user = gets.chomp!
    puts AbstractTrain.find(train_number_user).show_carriges
    puts "Select carrige:"
    carrige_number_user = gets.chomp!
    AbstractTrain.find(train_number_user).delete_carrige(carrige_number_user)
    puts "Carrige removed"
    invitation
  end
end
=end

class Main
  attr_accessor :stations, :trains
  def initialize
    @stations = []
    @trains = []
  end

  def test_data
    train_cargo1 = CargoTrain.new("crg-21")
    train_cargo2 = CargoTrain.new("crg-22")
    train_passenger1 = PassengerTrain.new("pas-10")
    train_passenger2 = PassengerTrain.new("pas-19")
    station1 = Station.new("Uzlova")
    station2 = Station.new("Kh-Pass")
    count = 0
    6.times do
      count += 1
      train_cargo1.add_carrige(CargoCarrige.new(100*count,"INTERNATIONAL")) if count <= 3
      train_cargo2.add_carrige(CargoCarrige.new(30*count,"INTERNATIONAL")) if count > 3
    end
    count = 0
    6.times do
      count += 1
      train_passenger1.add_carrige(PassengerCarrige.new(20*count,"Human CO")) if count <= 3
      train_passenger2.add_carrige(PassengerCarrige.new(20*count,"Human CO")) if count > 3
    end






    station1.train_add(train_passenger1)
    station1.train_add(train_cargo1)
    station2.train_add(train_passenger2)
    station2.train_add(train_cargo2)

    @stations << station1
    @stations << station2
    @trains << train_passenger1
    @trains << train_passenger2
    @trains << train_cargo1
    @trains << train_cargo2

  end

  def show_trains

    @stations.each do |station|
      station.each_train do |train|
        puts "#{train.train_number} #{train.train_type} #{train.count_carrige}"
      end
    end
  end

  def show_carrige_main
    counter_cargo = 0
    counter_pass = 0
    @stations.each do |station|
      puts station.station_name
      station.each_train do |train|
        train.each_carrige do |carrige|
          if carrige.carrige_type == :passenger
            puts "#{counter_pass += 1} passenger #{carrige.seats_free} #{carrige.seats_occupied}"
          else
            puts "#{counter_cargo += 1} cargo #{carrige.volume_unamount} #{carrige.volume_amount}"
          end
        end
      end
    end
  end
end

m = Main.new
m.test_data
m.show_trains
m.show_carrige_main





