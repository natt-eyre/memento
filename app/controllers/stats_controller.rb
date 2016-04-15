class StatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @stats = UserStats.new(current_user)
  end
end
