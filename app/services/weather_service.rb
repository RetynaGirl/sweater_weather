class WeatherService
  def self.weather(lat, long)
    response = conn.get('data/2.5/onecall') do |req|
      req.params[:lat] = lat
      req.params[:lon] = long
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org/') do |req|
      req.params[:appid] = ENV['OPEN_WEATHER_API_KEY']
    end
  end
end
