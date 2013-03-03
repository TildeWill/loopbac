class CalendarsController < ApplicationController
  skip_before_filter :authenticate_user!

  respond_to :json
  def show
    respond_with(Google::Calendar.events('will@loopb.ac'))
  end
end