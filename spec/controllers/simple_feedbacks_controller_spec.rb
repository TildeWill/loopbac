require 'spec_helper'

describe SimpleFeedbacksController do
  include AuthenticatedController

  describe '#create' do
    it 'creates a feedback' do
      expect {
        post :create, simple_feedback: attributes_for(:simple_feedback).merge(subject_id: create(:subject).id)
      }.to change(SimpleFeedback, :count).by(1)
    end
  end

  describe '#index' do
    it 'assigns the given feedback' do
      included_feedback = create(:simple_feedback, author: current_user)
      excluded_feedback = create(:simple_feedback)
      get :index, about: 'others'
      assigns[:simple_feedbacks].should include(included_feedback)
      assigns[:simple_feedbacks].should_not include(excluded_feedback)
    end

    it 'assigns the received feedback' do
      included_feedback = create(:simple_feedback, subject: current_user)
      excluded_feedback = create(:simple_feedback)
      get :index, about: 'me'
      assigns[:simple_feedbacks].should include(included_feedback)
      assigns[:simple_feedbacks].should_not include(excluded_feedback)
    end
  end
end
