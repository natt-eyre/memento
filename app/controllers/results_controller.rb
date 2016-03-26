class ResultsController < ApplicationController
  before_action :authenticate_user!
  def index
    @search_results = current_user.entries.search_by_content(params[:query])
  end
end
