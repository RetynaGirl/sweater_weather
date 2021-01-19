class WeatherFacade
  def self.get_weather(lat, long)
    output = WeatherService.weather(lat, long)
  end
end
