#
class LinkTables < ActiveRecord::Migration[5.0]
  def up
    # associations
    add_column :associations, :sport_id, :integer
    add_foreign_key :associations, :sports

    # league
    add_column :leagues, :sport_id, :integer
    add_foreign_key :leagues, :sports

    add_column :leagues, :association_id, :integer
    add_foreign_key :leagues, :associations

    # game
    add_column :games, :sport_id, :integer
    add_foreign_key :games, :sports

    add_column :games, :arena_id, :integer
    add_foreign_key :games, :arenas

    add_column :games, :league_id, :integer
    add_foreign_key :games, :leagues

    # arena
    add_column :arenas, :address_id, :integer
    add_foreign_key :arenas, :addresses
  end

  def down
    # associations
    remove_foreign_key :associations, :sports
    remove_column :associations, :sport_id, :integer

    # league
    remove_foreign_key :leagues, :sports
    remove_column :leagues, :sport_id, :integer

    remove_foreign_key :leagues, :associations
    remove_column :leagues, :association_id, :integer

    # game
    remove_foreign_key :games, :sports
    remove_column :games, :sport_id, :integer

    remove_foreign_key :games, :arenas
    remove_column :games, :arena_id, :integer

    remove_foreign_key :games, :leagues
    remove_column :games, :league_id, :integer

    # arena
    remove_foreign_key :arenas, :addresses
    remove_column :arenas, :address_id, :integer
  end
end
