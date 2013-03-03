class ContactsController < ApplicationController
  respond_to :json
  def show
    respond_with(Google::Contact.all('will@loopb.ac'))
  end
end