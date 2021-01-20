class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      road_trip = RoadTripFacade.get_trip(params[:origin], params[:destination])
    else
      output = {
        error: 'Bad api key'
      }

      render json: output
    end
  end
end
