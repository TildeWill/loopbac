require 'spec_helper'

describe FeedbackController do
  include AuthenticatedController

  describe '#create' do
    it 'creates a feedback' do
      expect {
        post :create, feedback: attributes_for(:feedback)
      }.to change(Feedback, :count).by(1)
    end
  end

  describe '#index' do
    it 'assigns the given feedback' do
      included_feedback = create(:feedback, user: current_user)
      excluded_feedback = create(:feedback)
      get :index
      assigns[:feedback_given].should include(included_feedback)
      assigns[:feedback_given].should_not include(excluded_feedback)
    end

    it 'assigns the received feedback' do
      included_feedback = create(:feedback, about_email: current_user.email)
      excluded_feedback = create(:feedback)
      get :index
      assigns[:feedback_received].should include(included_feedback)
      assigns[:feedback_received].should_not include(excluded_feedback)
    end
  end
end
