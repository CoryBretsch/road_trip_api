require 'securerandom'

class Api::V1::UsersController < ApplicationController 

  def create
    begin
      user = User.create!(user_params)
      user.update!(api_key: SecureRandom.hex(10))
      render json: UserSerializer.new(user), status:201
    rescue ActiveRecord::RecordInvalid => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
      # Validation failed: Email can't be blank
    end



  end

    private 
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end