class StatsController < ApplicationController
  def show
    @stats = UserStats.new(current_user)
  end
end
