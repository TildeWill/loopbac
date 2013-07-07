require 'spec_helper'

describe Feedback do
  describe "#approve" do
    context "when the feedback is the third approved for the same subject" do
      let(:current_user) { create(:user) }
      let(:subject) { create(:user) }

      before do
        create_list(:rank_category, 2)
        2.times do
          create(:feedback, subject: subject, author: current_user).approve
        end
      end
      it "creates a ranking in each category" do
        expect {
          create(:feedback, subject: subject, author: current_user).approve
        }.to change(Ranking, :count).by(2)
      end
    end
  end

  describe ".can_review" do
    let(:current_user) { create(:user) }
    let(:reviewers) { create(:user, 2) }

    context "when feedback is about specified user" do
      let(:unshown_feedback) { create(:feedback, subject: current_user) }

      it "does not appear" do
        Feedback.can_review(current_user).should_not include(unshown_feedback)
      end
    end

    context "when feedback is by specified user" do
      let(:unshown_feedback) { create(:feedback, author: current_user) }

      it "does not appear" do
        Feedback.can_review(current_user).should_not include(unshown_feedback)
      end
    end

    context "when feedback has been reviewed by the user" do
      let(:unshown_feedback) { create(:feedback) }

      before do
        create(:meta_feedback, feedback: unshown_feedback, author: current_user)
      end

      it "does not appear" do
        Feedback.can_review(current_user).should_not include(unshown_feedback)
      end
    end

    context "when feedback is not in_review" do
      let(:unshown_feedback) { create(:feedback, state: "rejected") }

      it "does not appear" do
        Feedback.can_review(current_user).should_not include(unshown_feedback)
      end
    end
  end
end
