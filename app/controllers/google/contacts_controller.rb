require 'google/api_client'

module Google
  class ContactsController < ApplicationController
    respond_to :json
    def index
      respond_with Google::Contact.get_all(current_user.domain, current_user.authentication_token)
    end
  end
end