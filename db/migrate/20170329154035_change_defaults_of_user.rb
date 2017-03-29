#
class ChangeDefaultsOfUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :active, :boolean, default: false
    change_column :users, :permission, :integer, default: 0
  end
end
