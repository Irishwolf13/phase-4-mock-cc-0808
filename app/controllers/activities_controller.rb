class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :activity_not_found
  def index
    render json: Activity.all(), status: :ok
  end

  def destroy
    frank = Activity.find(params[:id])
    frank.destroy!
    head :no_content
  end

  private

  def activity_not_found
    render json: {"errors": "Activity not found"}, status: 422
  end
end
