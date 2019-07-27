class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.integer :round_id
      t.integer :user_id
      t.integer :complaint_id
      t.integer :guess
      t.timestamps
    end
  end
end
