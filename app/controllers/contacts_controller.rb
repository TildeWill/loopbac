class ContactsController < ApplicationController
  skip_before_filter :authenticate_user!

  respond_to :json
  def show
    respond_with(Google::Contact.all('will@loopb.ac'))
  end
end