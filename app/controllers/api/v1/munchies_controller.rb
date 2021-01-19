class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = MunchieFacade.get_munchie(start: params[:start], end: params[:end], food: params[:food])

    output = MunchieSerializer.new(munchie)

    render json: output
  end

end
