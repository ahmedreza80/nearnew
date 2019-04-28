class CitiesController < ApplicationController
  def index
    render json: City.where(state_id: params[:state_id]).pluck(:id, :name)
  end
end
