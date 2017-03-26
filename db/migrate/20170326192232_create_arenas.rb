#
class CreateArenas < ActiveRecord::Migration[5.0]
  def change
    create_table :arenas do |t|
      t.string :name
      t.string :court_identifier

      t.timestamps
    end
  end
end
