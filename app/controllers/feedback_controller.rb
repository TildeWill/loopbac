class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.author = current_user
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to(@feedback) }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:subject_id, :content)
  end
end