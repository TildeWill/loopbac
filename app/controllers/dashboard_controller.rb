class DashboardController < ApplicationController
  def index
    #@feedback = Feedback.new
    feedback_for_review = Feedback.can_review(current_user).first
    @meta_feedback = MetaFeedback.new(feedback: feedback_for_review) if feedback_for_review
  end
end