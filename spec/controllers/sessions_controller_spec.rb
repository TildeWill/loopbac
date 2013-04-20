require "spec_helper"

describe SessionsController do

  describe "#create" do
    it "should cache all users in the domain" do
      existing_user = create(:user)
      new_user = build(:user)

      existing_google_user = mock(Google::User, {
        first_name: existing_user.first_name,
        last_name: existing_user.last_name,
        name: existing_user.name,
        email: existing_user.email
      })
      new_google_user = mock(Google::User, {
        first_name: new_user.first_name,
        last_name: new_user.last_name,
        name: new_user.name,
        email: new_user.email
      })

      Google::User.stub(:all).and_return([existing_google_user, new_google_user])
      request.env['omniauth.auth'] = {"uid" => existing_user.uid}

      expect {
        post :create, provider: 'google_apps'
      }.to change(User, :count).by(1)

      user = User.last
      user.first_name.should == new_user.first_name
      user.last_name.should == new_user.last_name
      user.email.should == new_user.email
    end
  end
end