require 'spec_helper'

describe LoopKickoff do
  describe 'validations' do
    it { should validate_presence_of(:coach_email) }
    it { should validate_presence_of(:subject_email) }
    it { should validate_presence_of(:reviewer_emails) }
  end

  describe 'email' do
    let(:kickoff) { LoopKickoff.new(coach_email: 'coach@example.com',
                                    subject_email: 'subject@example.com',
                                    reviewer_emails: 'reviewer@example.com, reviewer2@example.com'
    ) }
    it 'emails the subject' do
      LoopMailer.should_receive(:kickoff_subject).and_return(mock("mail", deliver: nil))
      kickoff.save
    end

    it 'emails the each of the reviewers' do
      LoopMailer.should_receive(:kickoff_reviewer).twice.and_return(mock("mail", deliver: nil))
      kickoff.save
    end
  end
end
