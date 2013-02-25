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

  describe '#show' do
    it 'assigns the loop that was looked up by id' do
      loop = create(:loop)
      get :show, id: loop.id
      assigns[:loop].should == loop
    end
  end
end