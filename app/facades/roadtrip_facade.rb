class RoadtripFacade
  def self.get_trip(origin, destination)
    trip_data = MapService.trip(origin, destination)

    if trip_data[:info][:messages].include?('We are unable to route with the given locations.')
      travel_time_string = 'impossible route'
      forecast = nil
    else
      travel_time = Time.at(trip_data[:route][:realTime])
      travel_time_string = DateTime.parse(travel_time.to_s).strftime('%H hours %M minutes')

      lat = trip_data[:route][:locations].last[:latLng][:lat]
      long = trip_data[:route][:locations].last[:latLng][:lng]

      forecast = WeatherFacade.get_weather(lat, long)
    end

    road_trip_data = {
      start_city: origin,
      end_city: destination,
      travel_time: travel_time,
      travel_time_string: travel_time_string,
      forecast: forecast
    }

    Roadtrip.new(road_trip_data)
  end
end
