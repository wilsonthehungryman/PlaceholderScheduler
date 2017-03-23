#
class CreateAddresses < ActiveRecord::Migration[5.0]
  def up
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.integer :street_number
      t.text :notes
      t.string :postal_code
      t.integer :province_id

      t.timestamps
    end

    add_foreign_key :addresses, :provinces
  end

  def down
    drop_table :addresses
  end
end
