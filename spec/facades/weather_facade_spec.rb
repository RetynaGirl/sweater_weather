require 'rails_helper'

describe WeatherFacade do
  describe 'class methods' do
    it 'get_weather' do
      lat, long = 39.738453, -104.984853

      output = WeatherFacade.get_weather(lat, long)

      expect(output).to be_a(Forecast)
    end
  end
end
