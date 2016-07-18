class AddGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.string :designer, null: false
      t.text :description, null: false
      t.integer :max_players, null: false
      t.integer :min_players, null: false
      t.integer :max_playtime, null: false
      t.integer :min_playtime, null: false
      t.integer :year, null: false
    end
  end
end
