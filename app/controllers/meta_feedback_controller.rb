class MetaFeedbackController < ApplicationController
  def new
    feedback_for_review = Feedback.can_review(current_user).first
    @meta_feedback = MetaFeedback.new(feedback: feedback_for_review) if feedback_for_review
  end

  def create
    @meta_feedback = MetaFeedback.new(meta_feedback_params)
    @meta_feedback.author = current_user
    @meta_feedback.save
    @meta_feedback.feedback.review_for_release
    respond_with @meta_feedback
  end

  private
  def meta_feedback_params
    params.require(:meta_feedback).permit(:feedback_id, :actionability_score, :specificity_score, :kindness_score)
  end
end