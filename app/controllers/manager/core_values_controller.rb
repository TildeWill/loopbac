module Manager
  class CoreValuesController < ApplicationController
    before_filter -> { authorize! :manage, :core_values }

    def index
      @core_values = CoreValue.scoped
    end

    def new
      @core_value = CoreValue.new
    end

    def create
      @core_value = CoreValue.create(core_value_params)
      respond_with(:manager, @core_value)
    end

    def edit
      @core_value = CoreValue.find(params[:id])
    end

    def update
      @core_value = CoreValue.find(params[:id])
      @core_value.update_attributes(core_value_params)
      respond_with(:manager, @core_value)
    end

    def show
      @core_value = CoreValue.find(params[:id])
    end

    private
    def core_value_params
      params.require(:core_value).permit(:title, :description, :tag_list)
    end
  end
end
