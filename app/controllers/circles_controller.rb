class CirclesController < ApplicationController
  def index
    @circles = current_user.circles
  end

  def show
    @circle = current_user.circles.find_by_id(params[:id])
  end
end