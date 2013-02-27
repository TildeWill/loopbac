require 'spec_helper'

describe LoopMailer do
  let(:loop) {create(:loop) }
  describe '#kickoff_reviewer' do
    before(:all) do
      @email = LoopMailer.kickoff_reviewer(loop).deliver
    end

    it "delivers to the email listed in the loop" do
      @email.should deliver_to(loop.email)
    end

    it "should contain a link to loop" do
      @email.should have_body_text(/#{loop_path(loop)}/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/asked to loopbac/)
    end
  end
end