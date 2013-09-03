module Admin
  class ManagershipsController < ApplicationController
    before_filter -> { authorize! :manage, :settings }

    def index
      @managers = User.where(manages_people: true).order(:first_name, :last_name)
    end

    def new
      @managership = Managership.new
    end

    def create
      @managership = Managership.new(params[:managership])
      respond_with(@managership.save)
    end

    def destroy
      Managership.destroy(params[:id])
    end
  end
end
