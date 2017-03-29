class CreateOfficialAssociations < ActiveRecord::Migration[5.0]
  def up
    create_table :official_associations do |t|
      t.string :name
      t.string :acronym
      t.integer :sport_id

      t.timestamps
    end

    # associations
    remove_foreign_key :associations, :sports
    remove_column :associations, :sport_id, :integer

    add_foreign_key :official_associations, :sports

    # league
    remove_foreign_key :leagues, :associations
    remove_column :leagues, :association_id, :integer

    add_column :leagues, :official_association_id, :integer
    add_foreign_key :leagues, :official_associations

    # user
    remove_foreign_key :users, :associations
    remove_column :users, :association_id, :integer

    add_column :users, :official_association_id, :integer
    add_foreign_key :users, :official_associations

    drop_table :associations
  end

  def down
    # associations
    remove_foreign_key :associations, :sports

    # league
    remove_foreign_key :leagues, :official_association
    remove_column :leagues, :official_association_id, :integer

    # user
    remove_foreign_key :users, :official_association
    remove_column :users, :official_association_id, :integer

    drop_table :official_associations
  end
end
