class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_entry, only: [ :show, :edit, :update, :destroy]

  def index
    @entries = current_user.entries.all
  end

  def new
    if params["target_date"] == "today"
      @entry = current_user.entries.new({target_date: Time.now})
    elsif params["target_date"] == "yesterday"
      @entry = current_user.entries.new({target_date: Time.now - 1.day})
    else
      @entry = current_user.entries.new
    end
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
  end

  def edit
  end

  def update
    if @entry.update_attributes(entry_params)
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy!
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:content, :target_date, :picture)
  end

  def get_entry
    @entry = current_user.entries.find(params[:id])
  end

end
