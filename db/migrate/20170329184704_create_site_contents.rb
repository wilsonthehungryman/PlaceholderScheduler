#
class CreateSiteContents < ActiveRecord::Migration[5.0]
  def change
    create_table :site_contents do |t|
      t.string :page
      t.integer :index
      t.boolean :active
      t.integer :image_id

      t.timestamps
    end
  end
end
