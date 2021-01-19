class WeatherFacade
  def self.get_weather(lat, long)
    weather_data = WeatherService.weather(lat, long)

    collection = Forecast.create

    current_weather = collection.weathers.create(weather_params(weather_data[:current], 'current'))

    hourly_weathers = weather_data[:hourly].map do |weather|
      collection.weathers.create(weather_params(weather, 'hourly'))
    end

    daily_weathers = weather_data[:daily].map do |weather|
      collection.weathers.create(weather_params(weather, 'daily'))
    end

    collection
  end

  def self.weather_params(input, type)
    output = input.slice(:sunrise, :sunset, :humidity, :uvi, :visibility, :wind_speed)

    output[:wind_direction] = wind_direction(input[:wind_deg])

    temp = input[:temp]
    if temp.instance_of?(Hash)
      output[:max_temp] = temp[:max]
      output[:min_temp] = temp[:min]
    else
      output[:temperature] = temp
    end

    output[:feels_like] = input[:feels_like] unless type == 'daily'

    output[:datetime] = input[:dt]
    output[:forecast_type] = type

    output
  end

  def self.wind_direction(degrees)
    index = (degrees / 22.5 + 0.5).to_i
    directions = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]

    directions[index % 16]
  end
end
