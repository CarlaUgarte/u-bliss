class UsersController < ApplicationController
  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end
end
