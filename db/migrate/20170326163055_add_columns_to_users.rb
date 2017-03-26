#
class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :name
      t.integer :address_id
      t.date :DateOfBirth
      t.string :user_name
      t.integer :permission
      t.boolean :active
    end

    add_foreign_key :users, :addresses
  end
end
