class ProfilesController < ApplicationController
  respond_to :json
  def show
    respond_with(Google::Profile.all('loopb.ac'))
  end
end