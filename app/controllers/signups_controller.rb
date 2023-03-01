class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :signup_not_created
  def create
    frank = Signup.create!(strong_params)
    render json: frank.activity, status: :created
  end

  private

  def signup_not_created
    render json: {"errors": ["validation errors"]}, status: 422
  end
  def strong_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
