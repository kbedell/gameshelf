class AddUsergamesIndex < ActiveRecord::Migration
  def up
    add_index :usersgames, [:game_id, :user_id], unique: true
  end

  def down
    remove_index :usersgames, column: [:game_id, :user_id]
  end
end
