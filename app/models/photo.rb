class Photo < ActiveRecord::Base
  before_create :default_name

  attr_accessible :author, :name, :image
  has_attached_file :image,
    :styles => {:thumb => "300x300>", :original => "2048x2048>"},
    :path => ":rails_root/public/system/:attachment/:style/:id_:basename.:extension",
    :url => "/system/:attachment/:style/:id_:basename.:extension"

  has_attached_file :video

  def default_name
    self.name ||= File.basename(image.original_filename, '.*').titleize if image
  end
end
