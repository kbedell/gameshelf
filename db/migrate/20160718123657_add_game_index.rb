class AddGameIndex < ActiveRecord::Migration
  def up
    add_index :games, [:name, :year], :unique => true
  end
  def down
    remove_index :games, :column => [:name, :year]
  end
end
