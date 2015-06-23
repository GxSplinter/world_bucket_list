class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @destination = current_user.destinations.new
  end

  def create
    @destination = current_user.destinations.new(destination_params)

    if @destination.valid?
      @destination.save!
      redirect_to user_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    current_user.destinations.find(params[:id]).destroy
    redirect_to user_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name)
  end
end
