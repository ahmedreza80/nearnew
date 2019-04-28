class LocationsController < ApplicationController
  def index
    render json: Location.where(city_id: params[:city_id]).pluck(:id, :name)
  end
end

