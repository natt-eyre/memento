class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [ :edit, :update ]

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path
      flash[:success] = "Settings saved!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:subscribed)
  end

  def get_user
    @user = current_user
  end
end
