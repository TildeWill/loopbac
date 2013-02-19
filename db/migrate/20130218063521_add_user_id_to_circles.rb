class AddUserIdToCircles < ActiveRecord::Migration
  def up
    rename_column :circles, :creator_id, :user_id

    remove_column :memberships, :user_id
    add_column :memberships, :contact_email, :string
  end
end
