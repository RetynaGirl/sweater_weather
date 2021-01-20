class Api::V1::BackgroundController < ApplicationController
  def show
    background = BackgroundFacade.get_background(params[:location])

    output = BackgroundSerializer.new(background)

    render json: output
  end
end
