require 'spec_helper'

describe LoopKickoff do
  it { should validate_presence_of(:coach_email) }
  it { should validate_presence_of(:subject_email) }
  it { should validate_presence_of(:reviewer_emails) }
end
