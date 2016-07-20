class AddOmniauthAmazon < ActiveRecord::Migration
  def change
    add_column :users, :provider, :integer
    add_column :users, :uid, :integer
  end
end
