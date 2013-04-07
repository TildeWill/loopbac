class LoopsController < ApplicationController

  def index
    @created_loops = current_user.created_loops
    @assigned_loops = current_user.assigned_loops
  end

  def show
    @loop = Loop.find(params[:id])
  end

  def edit
    @loop = Loop.find(params[:id])
  end

  def update
  end
end