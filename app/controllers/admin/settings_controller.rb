module Admin
  class SettingsController < ApplicationController
    before_filter ->{ authorize! :manage, :settings }

    def edit

    end
  end
end
