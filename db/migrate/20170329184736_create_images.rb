#
class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.string :name
      t.string :description
      t.string :alt

      t.timestamps
    end

    add_foreign_key :site_contents, :images
  end
end
