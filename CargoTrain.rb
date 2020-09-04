require_relative 'AbstractTrain'
require_relative 'CargoCarrige'
class CargoTrain < AbstractTrain
  def train_type
    :cargo
  end

  def add_carrige(carrige)
    carrige.carrige_type == :cargo  ? train_carriges << carrige : "error"
  end
  class << self
    attr_reader :instances

    def all
      @@instances.select { |_,y| y.train_type == :cargo }
    end

  end


end
