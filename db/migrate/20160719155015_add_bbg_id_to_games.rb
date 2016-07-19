class AddBbgIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :bggid, :integer
  end
end
