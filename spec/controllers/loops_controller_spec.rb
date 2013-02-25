require 'spec_helper'

describe LoopsController do
  include AuthenticatedController

  describe '#index' do
    it "assigns the current_user's loops" do
      create(:loop, created_by_email: current_user.email)
      create(:loop, email: current_user.email)
      get :index
      assigns(:created_loops).should == current_user.created_loops
      assigns(:assigned_loops).should == current_user.assigned_loops
    end
  end
end