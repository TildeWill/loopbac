require 'spec_helper'

describe LoopKickoffsController do
  include AuthenticatedController

  describe '#new' do
    before do
      controller.stub(:current_contacts).and_return([])
    end

    it 'assigns a new Loop' do
      get :new
      assigns[:loop_kickoff].should be_a(LoopKickoff)
      assigns(:loop_kickoff).should be_new_record
    end
  end
end