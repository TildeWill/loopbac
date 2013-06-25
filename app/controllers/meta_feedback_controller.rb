class MetaFeedbackController < ApplicationController
  def new
    @meta_feedback = MetaFeedback.new(feedback: Feedback.last)
  end

  def create
    @meta_feedback = MetaFeedback.new(meta_feedback_params)
    @meta_feedback.author = current_user
    respond_to do |format|
      if @meta_feedback.save
        format.html { redirect_to(@meta_feedback) }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  private
  def meta_feedback_params
    params.require(:meta_feedback).permit(:feedback_id, :actionability_score, :specificity_score, :kindness_score)
  end
end