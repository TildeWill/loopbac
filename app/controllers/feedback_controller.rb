class FeedbackController < ApplicationController
  def index
    @feedback = Feedback.new
    @feedback_given = current_user.feedback_given
    @feedback_received = current_user.feedback_received
  end

  def create
    @feedback = current_user.feedback_given.create(feedback_params)
    respond_with @feedback, location: feedback_index_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:about_email, :details)
  end
end
