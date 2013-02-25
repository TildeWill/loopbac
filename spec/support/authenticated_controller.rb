module AuthenticatedController
  extend ActiveSupport::Concern

  included do
    let(:current_user) { create(:user) }

    before do
      session[:user_id] = current_user.id
    end
  end
end