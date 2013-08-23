module Admin
  class ManagershipsController < ApplicationController
    before_filter -> { authorize! :manage, :settings }
    def new
      @managership = Managership.new
      @managers = User.where(manages_people: true).order(:first_name, :last_name)
    end

    def create
      @managership = Managership.new(params[:managership])
      @managership.save
      render nothing: true
    end

    def destroy
      Managership.destroy(params[:user_id])
    end
  end
end
