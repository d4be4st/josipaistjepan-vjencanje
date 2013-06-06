class AddVideoToPhoto < ActiveRecord::Migration
  def change
    add_attachment :photos, :video
  end
end
