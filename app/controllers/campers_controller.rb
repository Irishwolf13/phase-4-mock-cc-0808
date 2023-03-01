class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :camper_not_created

  def index
    render json: Camper.all(), status: :ok
  end
  def show
    frank = Camper.find(params[:id])
    render json: frank, serializer: StuffSerializer, status: :ok
  end
  def create
    frank = Camper.create!(strong_params)
    render json: frank, status: :created
  end

  private

  def camper_not_found
    render json: {"error": "Camper not found"}, status: :not_found
  end

  def camper_not_created
    render json: {"errors": ["validation errors"]}, status: 422
  end

  def strong_params
    params.permit(:name, :age)
  end
end
