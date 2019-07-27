class ChangeDefaultScoreOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :game_sessions,:score,:integer, :default => 0
  end
end
