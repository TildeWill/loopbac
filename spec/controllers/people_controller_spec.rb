require 'spec_helper'

describe PeopleController do
  describe "#index" do
    it "assigns people" do
      user = create(:user)
      sign_in user
      get :index
      response.should == 5
    end
  end
end