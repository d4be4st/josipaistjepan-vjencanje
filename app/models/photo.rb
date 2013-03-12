class Photo < ActiveRecord::Base
  before_create :default_name

  attr_accessible :author, :name, :image
  has_attached_file :image, 
    :styles => {:thumb => "300x300>"}, 
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
      :path => proc { |style| "wedding/#{style}/#{id}_#{image.original_filename}" }
    }

  def default_name
    self.name ||= File.basename(image.original_filename, '.*').titleize if image
  end
end
