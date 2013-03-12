class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(params[:photo])
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
end
