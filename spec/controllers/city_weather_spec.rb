require 'rails_helper'

describe Api::V1::WeatherController, type: :controller do
  it 'when a request comes in for weather forcast' do
    # input = JSON.parse(IO.read('spec/fixtures/denver_weather_return.json'), symbolize_names: true)

    # allow(WeatherService).to receive(:weather).and_return(input)

    get :show, params: { location: 'denver,co' }

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output).to be_a Hash

    data = output[:data]

    expect(data[:id]).to be nil
    expect(data[:type]).to eq 'forecast'
    expect(data[:attributes]).to be_a Hash

    expect(data[:attributes][:current_weather]).to be_a Hash
    expect(data[:attributes][:current_weather][:datetime]).to be_a String
    expect(data[:attributes][:current_weather][:sunrise]).to be_a String
    expect(data[:attributes][:current_weather][:sunset]).to be_a String
    expect(data[:attributes][:current_weather][:temperature]).to be_a Float
    expect(data[:attributes][:current_weather][:feels_like]).to be_a Float
    expect(data[:attributes][:current_weather][:humidity]).to be_a Integer
    expect(data[:attributes][:current_weather][:uvi]).to be_a Integer
    expect(data[:attributes][:current_weather][:visibility]).to be_a Integer
    expect(data[:attributes][:current_weather][:conditions]).to be_a String
    expect(data[:attributes][:current_weather][:icon]).to be_a String

    expect(data[:attributes][:daily_weather]).to be_a Array
    expect(data[:attributes][:daily_weather][0]).to be_a Hash
    expect(data[:attributes][:daily_weather][0][:date]).to be_a String
    expect(data[:attributes][:daily_weather][0][:sunrise]).to be_a String
    expect(data[:attributes][:daily_weather][0][:sunset]).to be_a String
    expect(data[:attributes][:daily_weather][0][:max_temp]).to be_a Float
    expect(data[:attributes][:daily_weather][0][:min_temp]).to be_a Float
    expect(data[:attributes][:daily_weather][0][:conditions]).to be_a String
    expect(data[:attributes][:daily_weather][0][:icon]).to be_a String

    expect(data[:attributes][:hourly_weather]).to be_a Array
    expect(data[:attributes][:hourly_weather][0]).to be_a Hash
    expect(data[:attributes][:hourly_weather][0][:time]).to be_a String
    expect(data[:attributes][:hourly_weather][0][:temperature]).to be_a Float
    expect(data[:attributes][:hourly_weather][0][:wind_speed]).to be_a String
    expect(data[:attributes][:hourly_weather][0][:wind_direction]).to be_a String
    expect(data[:attributes][:hourly_weather][0][:conditions]).to be_a String
    expect(data[:attributes][:hourly_weather][0][:icon]).to be_a String
  end
end
