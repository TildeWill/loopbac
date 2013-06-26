class MetaFeedbackController < ApplicationController
  def new
    @meta_feedback = MetaFeedback.new(feedback: Feedback.last)
  end

  def create
    @meta_feedback = MetaFeedback.new(meta_feedback_params)
    @meta_feedback.author = current_user
    @meta_feedback.save
    respond_with @meta_feedback
  end

  private
  def meta_feedback_params
    params.require(:meta_feedback).permit(:feedback_id, :actionability_score, :specificity_score, :kindness_score)
  end
end