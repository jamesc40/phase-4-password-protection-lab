class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_res

  private 

  def record_invalid_res invalid
    render json: { error: invalid }, status: :unprocessable_entity
  end

end
