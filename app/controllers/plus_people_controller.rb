class PlusPeopleController < ApplicationController
  respond_to :json
  def show
    respond_with Google::PlusPeople.find(params[:id])
  end
end