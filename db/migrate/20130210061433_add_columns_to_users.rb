class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :full_name, :string
    add_column :users, :image_url, :text
    add_column :users, :uid, :string
  end
end
