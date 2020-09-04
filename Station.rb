class Station
  attr_accessor :station_name, :instances_station
  @@instances_station = Hash.new
  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @@instances_station[station_name] = self
  end

  def train_add(new_train)
    @trains << new_train
  end


  def trains_on_station
    @trains
  end

  def trains_type
    cargo_count = 0
    pass_count = 0
    @trains.each { |x| x.train_type == :cargo ? cargo_count += 1 : pass_count += 1 }
    puts "Pass = #{pass_count}, Cargos = #{cargo_count}"
  end

  def each_train
    @trains.each { |x| yield(x) }
  end

  def train_departure(train_number)
    @trains[@trains.index(train_number)].move_next_station
    @trains.delete(train_number)
  end

  class << self
    attr_reader :instances

    def all
      @@instances_station
    end

    def find(station_name)
      if @@instances_station[station_name] != nil
        @@instances_station[station_name]
      else
        nil
      end
    end

  end

end

