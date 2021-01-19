require 'rails_helper'

describe Forecast, type: :model do
  describe 'instance methods' do
    before :each do
      input = JSON.parse(IO.read('spec/fixtures/denver_weather_return.json'), symbolize_names: true)

      allow(WeatherService).to receive(:weather).and_return(input)

    end

    it 'current' do
      forecast = WeatherFacade.get_weather(30, 30)

      expect(forecast.current.temperature).to eq(270.13)
    end

    it 'daily' do
      forecast = WeatherFacade.get_weather(30, 30)

      expect(forecast.daily[0].humidity).to eq(73)
    end
  end
end
