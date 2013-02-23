class LoopsController < ApplicationController

  def index
    @created_loops = current_user.created_loops
    @assigned_loops = current_user.assigned_loops
  end
end