class RenameColumnRounds < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :rounds, :max_rounds
  end
end
