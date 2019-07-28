class DeleteRoundIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics,:round_id
  end
end
