class AbstractTrain

  attr_accessor :current_station_index, :train_type, :train_number, :route, :train_carriges, :train_speed, :train_type
  @@instances = Hash.new

  NUMBER_FORMAT = /^(\d|[a-z]){3}-?((\d{2})|([a-z]{2}))$/i


  def initialize(train_number)
    @train_number = train_number
    @train_carriges = []
    @train_speed = 0
    @current_station_index = 0
    @@instances[train_number] = self
  end

  def validate!
    raise "Incorrect number of train" if train_number !~ NUMBER_FORMAT
  end

  def each_carrige
    @train_carriges.each { |x| yield(x) }
  end

  def instances
    @@instances
  end

  def train_add_route(route)
    self.route = route
  end

  def speed_up(speed_plus)
    @train_speed += speed_plus
  end

  def speed_breake
    @train_speed = 0
  end

  def speed_show
    @train_speed
  end

  def count_carrige
    @train_carriges.count
  end

  def show_carriges
    @train_carriges
  end

  def add_carrige(carrige)
    @train_carriges << carrige if @train_speed == 0
  end

  def delete_carrige(carrige)
    @train_carriges.delete(carrige) if @train_speed == 0
  end

  def move_next_station
    @current_station_index += 1
  end

  def next_station_show
    route.stations[@current_station_index + 1]
  end

  def  prev_station_show
    route.stations[@current_station_index - 1]
  end


  class << self
    attr_reader :instances

    def all
      @@instances
    end

    def find(train_number_par)
      if @@instances[train_number_par] != nil
        @@instances[train_number_par]
      else
        nil
      end
    end

  end

end

