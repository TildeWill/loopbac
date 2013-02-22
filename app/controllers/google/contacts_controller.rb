module Google
  class ContactsController < ApplicationController
    respond_to :json, :html
    def index
      contacts = Google::Contact.get_all(current_user.domain, current_user.oauth2_token, current_user.refresh_token)
      @contacts = Google::ContactDecorator.decorate_collection(contacts)
    end
  end
end