class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :complain_text
      t.integer :round_id
      t.integer :user_id

      t.timestamps
    end
  end
end
