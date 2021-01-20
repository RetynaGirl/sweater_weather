class Api::V1::WeatherController < ApplicationController
  def show
    location = params[:location]

    if location.nil?
      error = {
        error: 'No location provided'
      }

      render json: error, status: 400
      return
    end

    begin
      lat, long = MapFacade.get_coords(location)
    rescue ProjectError::NoResults
        error = {
          error: 'No results for provided location'
        }

        render json: error, status: 400
    end

    forecast = WeatherFacade.get_weather(lat, long)

    forecast.id = nil

    output = ForecastSerializer.new(forecast)

    render json: output
  end
end
