class SupportController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_filter :scope_current_tenant
  def show

  end
end
