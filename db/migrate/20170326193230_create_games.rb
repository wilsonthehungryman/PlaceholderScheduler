class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :home
      t.string :away

      t.timestamps
    end
  end
end
