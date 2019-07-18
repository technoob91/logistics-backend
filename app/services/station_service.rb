class StationService
  BASE_DISTANCE = 5
  def find_closest_station(address, distance, category_id)
    destination = GraphhoperService.new.geocode(address)
    stations = Station.within(distance, :origin => destination)
    find_closest_station(address, distance + BASE_DISTANCE, category_id) if stations.empty?
    times = calculate_times_to_destination(destination, stations)
    find_best_station(stations, times, category_id)
  end

  def calculate_times_to_destination(destination, stations)
    response = GraphhoperService.new.find_distance_time(stations, destination)
    response['times'].flatten
  end

  def find_best_station(stations, times, category_id)
    least_time = times.each_with_index.min
    closest_station = stations[least_time.second]
    if check_product_inventory(closest_station, category_id)
      closest_station.time = least_time.first
      closest_station
    else
      times.delete(times.min)
      find_best_station(stations, times, category_id)
    end
  end

  def check_product_inventory(station, category)
    Product.where(station_id: station.id, category_id: category).present?
  end
end
