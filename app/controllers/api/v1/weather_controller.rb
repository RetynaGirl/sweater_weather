class Api::V1::WeatherController < ApplicationController
  def show
    location = params[:location]

    lat, long = MapFacade.get_coords(location)

    forecast = WeatherFacade.get_weather(lat, long)

    forecast.id = nil

    output = ForecastSerializer.new(forecast)

    render json: output
  end
end
