#
class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :acronym
      t.integer :age_min
      t.integer :age_max
      t.boolean :male
      t.boolean :female

      t.timestamps
    end
  end
end
