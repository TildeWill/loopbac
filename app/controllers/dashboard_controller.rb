class DashboardController < ApplicationController
  def index
    @feedback = Feedback.new
  end
end