class PriceService

  def calculate_delivery_rate(params)
    destination = params[:address]
    @station = StationService.new.find_closest_station(destination, 5, params[:category])
    products = @station.products.sort_by(&:weight)

    products.each do | product |
      hours = calculate_hours(@station.time)
      product.delivery_rate = calculate_rate(product.weight, hours)
    end
  end

  def calculate_rate(weight, hours)
    if weight < 5000
      (75 * hours) * 2
    else
      (95 * hours) * 2
    end
  end

  def calculate_hours(secs)
    (secs.to_f/3600).ceil
  end
end
