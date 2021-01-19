require 'rails_helper'

describe WeatherFacade do
  describe 'class methods' do
    it 'get_weather' do
      lat, long = 39.738453, -104.984853

      expect(WeatherFacade.get_weather(lat, long)).to be_a(WeatherRelation)
    end
  end
end
