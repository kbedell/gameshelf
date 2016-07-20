class RemoveGamesConstraints < ActiveRecord::Migration
  def up
    change_column_null(:games, :genre, true)
    change_column_null(:games, :designer, true)
    change_column_null(:games, :description, true)
  end

  def down
    change_column_null(:games, :genre, false)
    change_column_null(:games, :designer, false)
    change_column_null(:games, :description, false)
  end
end
