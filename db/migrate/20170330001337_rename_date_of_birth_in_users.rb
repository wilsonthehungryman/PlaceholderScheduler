class RenameDateOfBirthInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :DateOfBirth, :birthday
  end
end
