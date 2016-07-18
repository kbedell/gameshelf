class AddUsersgames < ActiveRecord::Migration
  def change
    create_table :usersgames do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
   end
  end
end
