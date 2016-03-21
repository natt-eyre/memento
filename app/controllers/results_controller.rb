class ResultsController < ApplicationController
  def index
    @search_results = Entry.search_by_content(params[:query])
  end
end