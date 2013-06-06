class AdminController < ApplicationController

  http_basic_authenticate_with :name => "admin", :password => "spelljsfire"

  def photos
    @photos = Photo.all
  end
  
end