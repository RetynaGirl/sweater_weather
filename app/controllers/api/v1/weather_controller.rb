class Api::V1::WeatherController < ApplicationController
  def show
    location = params[:location]

    lat, long = MapFacade.get_coords(location)

    weather = WeatherFacade.get_weather(lat, long)

    render json: output
  end
end
