class HomeController < ApplicationController
  def index
    @photos = Photo.order('created_at desc').paginate(:page => params[:page], :per_page => 50)
  end
end
