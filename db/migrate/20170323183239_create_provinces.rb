#
class CreateProvinces < ActiveRecord::Migration[5.0]
  def up
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation
      t.integer :country_id

      t.timestamps
    end

    add_foreign_key :provinces, :countries
  end

  def down
    drop_table :province
  end
end
