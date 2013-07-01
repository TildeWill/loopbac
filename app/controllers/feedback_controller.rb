class FeedbackController < ApplicationController
  def index
    @received_feedback = current_user.received_feedback.with_state(:approved).order('created_at desc')
    @written_feedback = current_user.written_feedback.order('created_at desc')
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.author = current_user
    @feedback.submit if @feedback.save
    respond_with @feedback
  end

  private
  def feedback_params
    params.require(:feedback).permit(:subject_id, :content)
  end
end