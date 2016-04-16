class StatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    if @user.entries.empty?
      @stats = EmptyUserStats.new(current_user)
    else
      @stats = UserStats.new(current_user)
    end
  end
end
