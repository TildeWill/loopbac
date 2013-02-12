class CirclesController < ApplicationController
  def index
    @circles = current_user.circles
  end
end