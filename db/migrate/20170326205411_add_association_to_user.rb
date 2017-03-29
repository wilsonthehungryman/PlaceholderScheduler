class AddAssociationToUser < ActiveRecord::Migration[5.0]
  def up
    # may be revised if there is a need to have multiple associations per user
    add_column :users, :association_id, :integer
    add_foreign_key :users, :associations
  end

  def down
    remove_foreign_key :users, :associations
    remove_column :users, :association_id, :integer
  end
end
