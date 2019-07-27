class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_count
      t.rounds :integer 
      t.timestamps
    end
  end
end
