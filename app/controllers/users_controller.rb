class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_res
  end

  def show
    #user = User.find_by(username: params[:username])   
    #if user&.authenticate(params[:password])
      #session[:user_id] = user.id
      #render json: user, status: :found
    #else
      #render json: { error: 'Invalid username or password' }, status: :unauthorized
    #end
    user = User.find(session[:user_id])
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def record_invalid_res invalid
    render json: { error: invalid }, status: :unprocessable_entity
  end

  def authorize
    render json: { error: 'Not authorized' }, status: :unauthorized unless session.include :user_id
  end
end
