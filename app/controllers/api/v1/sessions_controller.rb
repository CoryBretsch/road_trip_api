class Api::V1::SessionsController < ApplicationController 

  def create
    user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        render json: UserSerializer.new(user), status: 200
      else
        render json: ErrorSerializer.new(ErrorMessage.new("Invalid Credentials", 400)).serialize_json, status: 400
      end
  end
end