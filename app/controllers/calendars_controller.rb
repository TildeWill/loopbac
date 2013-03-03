class CalendarsController < ApplicationController
  respond_to :json
  def show
    respond_with(Google::Calendar.events('will@loopb.ac'))
  end
end