require_relative 'AbstractTrain'
require_relative 'PassengerCarrige'
class PassengerTrain < AbstractTrain

  def train_type
    :passenger
  end


  def add_carrige(carrige)
   carrige.carrige_type == :passenger  ? train_carriges << carrige : "error"
  end

  class << self
    attr_reader :instances

    def all
      @@instances.select { |_,y| y.train_type == :passenger }
    end

  end

end
