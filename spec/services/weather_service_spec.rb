require 'rails_helper'

describe WeatherService do
  describe 'class methods' do
    it 'weather' do
      lat, long = 39.738453, -104.984853
      parsed_json = JSON.parse(IO.read('spec/fixtures/denver_weather_return.json'), symbolize_keys: true)

      output = WeatherService.weather(lat, long)

      expect(output.key?(:current))
      expect(output.key?(:hourly))
      expect(output.key?(:daily))
      expect(output.key?(:minutely))
    end
  end
end
