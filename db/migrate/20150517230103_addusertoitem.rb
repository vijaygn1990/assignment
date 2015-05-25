class Addusertoitem < ActiveRecord::Migration
  def change
  	add_column :items, :user_id, :string
  	add_index :items, :user_id
  end
end
