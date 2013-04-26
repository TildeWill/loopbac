class SimpleFeedbacksController < ApplicationController

  def new
    @simple_feedback = SimpleFeedback.new
  end

  def index
    if params[:about] == 'me'
      @simple_feedbacks = current_user.feedback_received.decorate
    else
      @simple_feedbacks = current_user.feedback_given.decorate
    end
  end

  def create
    @simple_feedback = current_user.feedback_given.create!(feedback_params)
    FeedbackMailer.simple_feedback_received(@simple_feedback).deliver!
    respond_with @simple_feedback, location: simple_feedbacks_path(about: 'others')
  end

  private

  def feedback_params
    params.require(:simple_feedback).permit(:subject_id, :details)
  end
end
