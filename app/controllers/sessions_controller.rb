class SessionsController < ApplicationController
  def create
    render json: request.env["omniauth.auth"]
    #redirect_to users_path
  end
end
