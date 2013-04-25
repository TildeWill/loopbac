class PhotosController < ApplicationController
  def show
    image_data = Google::Photo.find(current_user.domain, params[:id])
    send_data(image_data, :filename => "#{current_user.domain}-#{params[:id]}", :type => 'image/*')
  end
end