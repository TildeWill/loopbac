class AddRefreshTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :refresh_token, :string
    rename_column :users, :authentication_token, :oauth2_token
  end
end
