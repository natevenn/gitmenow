class UserController < ApplicationController
  def show
    @user = current_user
    @repos = @user.repos
  end
end
