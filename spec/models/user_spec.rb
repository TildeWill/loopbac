require 'spec_helper'

describe User do
  describe 'relationships' do
    it { should have_many(:created_loops) }
  end

  describe '#domain' do
    it "returns everything after the @ in the user's email" do
      user = build(:user, email: 'test@mydomain.com')
      user.domain.should == 'mydomain.com'
    end
  end
end