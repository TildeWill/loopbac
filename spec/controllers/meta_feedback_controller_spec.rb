require 'spec_helper'

describe MetaFeedbackController do
  include AuthenticatedController
  describe "#create" do
    let(:subject) { create(:user) }
    let(:unapproved_feedback) { create(:feedback, subject: subject, author: current_user) }

    before do
      create(:rank_category)
      create_list(:feedback, 2, subject: subject, state: :approved, author: current_user)
      create(:meta_feedback, :agreeing, feedback: unapproved_feedback, author: current_user)
    end

    it "creates new meta feedback" do
      post :create, meta_feedback: attributes_for(:meta_feedback, :agreeing, feedback: unapproved_feedback).merge(feedback_id: unapproved_feedback.id)
      unapproved_feedback.reload.should be_approved
    end
  end
end