class DashboardController < ApplicationController
  def index
    @feedback = Feedback.new
    @meta_feedback = MetaFeedback.new(feedback: Feedback.last)
  end
end