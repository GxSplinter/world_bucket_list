class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @destinations = @user.destinations.sort_by { |dest| dest.name.downcase }
    render :show
  end
end
