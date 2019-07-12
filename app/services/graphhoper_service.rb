class GraphhoperService

  def geocode(address)
    uri = URI.parse(URI.escape("https://graphhopper.com/api/1/geocode?q=#{address}&locale=en&key=#{ENV['HOPPER_KEY']}"))
    res = JSON.parse(Net::HTTP.get(uri))
    [res['hits'].first['point']['lat'], res['hits'].first['point']['lng']]
  end

  def find_distance_time(stations, destination)
    uri = URI.parse("https://graphhopper.com/api/1/matrix?key=#{ENV['HOPPER_KEY']}")
    body = build_params(stations, destination)
    res = http_request(uri, body)
    JSON.parse(res.body)
  end

  def http_request(uri, body)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type': 'application/json'})
    request.body = body.to_json
    https.request(request)
  end

  def build_params(stations, destination)
    params = {
        :from_points => [],
        :to_points => [destination.reverse],
        :out_arrays => %w(times distances),
        :vehicle => "truck"
    }

    stations.each do |station|
      params[:from_points].push([station.longitude, station.latitude])
    end

    params
  end
end