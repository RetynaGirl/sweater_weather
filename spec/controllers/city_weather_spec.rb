require 'rails_helper'

describe Api::V1::WeatherController, type: :controller do
  it 'when a request comes in for weather forcast' do
    get :show, params: { location: 'denver,co' }

     output = JSON.parse(response.body, symbolize_keys: true)

    expect(output).to be_a Hash

    expect(output[:id]).to be nil
    expect(output[:type]).to be 'forecast'
    expect(output[:attributes]).to be_a Hash

    expect(output[:attributes][:current_weather]).to be_a Hash
    expect(output[:attributes][:current_weather][:datetime]).to be_a String
    expect(output[:attributes][:current_weather][:sunrise]).to be_a String
    expect(output[:attributes][:current_weather][:sunset]).to be_a String
    expect(output[:attributes][:current_weather][:temperature]).to be_a Float
    expect(output[:attributes][:current_weather][:feels_like]).to be_a Float
    expect(output[:attributes][:current_weather][:humidity]).to be_a Integer
    expect(output[:attributes][:current_weather][:uvi]).to be_a Integer
    expect(output[:attributes][:current_weather][:visibility]).to be_a Integer
    expect(output[:attributes][:current_weather][:conditions]).to be_a String
    expect(output[:attributes][:current_weather][:icon]).to be_a String

    expect(output[:attributes][:daily_weather]).to be_a Hash
    expect(output[:attributes][:daily_weather][:date]).to be_a String
    expect(output[:attributes][:daily_weather][:sunrise]).to be_a String
    expect(output[:attributes][:daily_weather][:sunset]).to be_a String
    expect(output[:attributes][:daily_weather][:max_temp]).to be_a Float
    expect(output[:attributes][:daily_weather][:min_temp]).to be_a Float
    expect(output[:attributes][:daily_weather][:conditions]).to be_a String
    expect(output[:attributes][:daily_weather][:icon]).to be_a String

    expect(output[:attributes][:hourly_weather]).to be_a Hash
    expect(output[:attributes][:hourly_weather][:time]).to be_a String
    expect(output[:attributes][:hourly_weather][:temperature]).to be_a Float
    expect(output[:attributes][:hourly_weather][:wind_speed]).to be_a String
    expect(output[:attributes][:hourly_weather][:wind_direction]).to be_a String
    expect(output[:attributes][:hourly_weather][:conditions]).to be_a String
    expect(output[:attributes][:hourly_weather][:icon]).to be_a String


  end
end
