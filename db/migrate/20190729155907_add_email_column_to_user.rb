class AddEmailColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :NVARCHAR
  end
end
