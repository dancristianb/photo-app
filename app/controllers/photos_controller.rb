class PhotosController < ApplicationController
  def create
    photo = Photo.new(user: current_user, image: params[:photo][:image])
    if photo.save
      flash[:notice] = 'Image saved!'
    else
      flash[:alert] = "Failed to save image... #{photo.errors.full_messages.join}"
    end

    redirect_to :root
  end
end
