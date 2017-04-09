#
class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :boolean
    add_column :users, :association_fees_paid, :boolean
    add_column :users, :games_reffed, :integer
    add_column :users, :games_missed, :integer
    add_column :users, :games_cancelled, :integer
  end
end
