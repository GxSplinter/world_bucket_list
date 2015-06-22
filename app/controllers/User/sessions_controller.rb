class User::SessionsController < Devise::SessionsController
before_action :authenticate_user!

  def show
    @user = current_user
    render :show
  end
end
