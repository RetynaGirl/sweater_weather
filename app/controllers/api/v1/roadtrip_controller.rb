class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      road_trip = RoadtripFacade.get_trip(params[:origin], params[:destination])

      output = RoadtripSerializer.new(road_trip)

      render json: output
    else
      output = {
        error: 'Bad api key'
      }

      render json: output, status: 400
    end
  end
end
