class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.author = current_user
    @feedback.save
    respond_with @feedback
  end

  private
  def feedback_params
    params.require(:feedback).permit(:subject_id, :content)
  end
end