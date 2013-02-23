require 'spec_helper'

describe LoopKickoffsController do
  let(:current_user) { create(:user) }
  before do
    sign_in(current_user)
  end

  describe '#new' do
    it 'assigns a new Loop' do
      get :new
      assigns(:loop_kickoff).should be_a(LoopKickoff)
      assigns(:loop_kickoff).should be_new_record
    end
  end

  describe '#index' do
    it "assigns the current_user's loops" do
      current_user.loop_kickoffs << create(:loop_kickoff)
      get :index
      assigns(:loop_kickoffs).should == current_user.loop_kickoffs
    end
  end

end