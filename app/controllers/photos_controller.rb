class PhotosController < ApplicationController
  Mime::Type.register "image/png", :png

  def show
    respond_to do |format|
      format.png { render :text => Google::Photo.find(params[:id]),
                          :status => 200, :content_type => 'image/png' }
    end
  end
end