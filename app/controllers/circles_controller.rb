class CirclesController < ApplicationController
  respond_to :html
  def index
    @circle = Circle.new
    @circles = current_user.circles
  end

  def show
    @circle = current_user.circles.find_by_id(params[:id])
    @membership = Membership.new(circle: @circle)
  end

  def create
    @circle = current_user.circles.create(params[:circle])
    respond_with(@circle, :location => circles_path)
  end
end