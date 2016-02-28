class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.entries.all
  end

  def new
    @entry = current_user.entries.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def show
    @entry = current_user.entries.find(params[:id])
  end


  private

  def entry_params
    params.require(:entry).permit(:content)
  end

end
