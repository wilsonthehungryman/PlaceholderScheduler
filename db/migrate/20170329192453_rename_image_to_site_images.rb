#
class RenameImageToSiteImages < ActiveRecord::Migration[5.0]
  def change
    rename_table :images, :site_images
  end
end
