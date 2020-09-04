class Route

  attr_accessor :stations

  def initialize(start_station, finish_station)
    @start_station = start_station
    @finish_station = finish_station
    @stations = [start_station,finish_station]
  end

  def route_station_add(station_name)
    @stations.insert(-2,station_name)
  end

  def route_station_remove(station_name)
    @stations.delete(station_name)
  end

  def route_station_show
    @stations.each { |x| puts x.station_name }
  end
end

