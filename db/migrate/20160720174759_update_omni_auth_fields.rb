class UpdateOmniAuthFields < ActiveRecord::Migration
  def up
    change_column :users, :uid,  :string
    change_column :users, :provider,  :string
  end

  def downs
    change_column :users, :uid,  :integer
    change_column :users, :provider,  :integer
  end
end
