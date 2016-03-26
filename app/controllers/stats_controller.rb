class StatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @stats = UserStats.new(current_user)
  end
end
