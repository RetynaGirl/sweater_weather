class Roadtrip
  attr_reader :id, :start_city, :end_city, :travel_time, :forecast, :travel_time_string

  def initialize(data)
    @id = nil
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    @forecast = data[:forecast]
    @travel_time_string = data[:travel_time_string]
  end


  def weather_at_eta
    if forecast
      {
        temperature: @forecast.hourly[travel_time.hour].temperature,
        conditions: @forecast.hourly[travel_time.hour].conditions
      }
    else
      nil
    end
  end
end
