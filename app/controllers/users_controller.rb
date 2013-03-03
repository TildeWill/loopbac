class UsersController < ApplicationController
  respond_to :json
  def index
    respond_with(Google::User.all('loopb.ac'))
  end

  def show
    respond_with(Google::User.find('loopb.ac', params[:id]))
  end
end