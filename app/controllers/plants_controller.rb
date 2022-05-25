class PlantsController < ApplicationController

  # GET /plants   #Index
  def index
    plants = Plant.all 
    render json: plants
  end

  # GET /plants/:id    #Show
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(plants_params)
    render json: plant, status: :created
  end

  private

  def plants_params
    params.permit(:name, :image, :price)
  end
end
