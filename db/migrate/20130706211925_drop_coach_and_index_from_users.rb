class DropCoachAndIndexFromUsers < ActiveRecord::Migration
  def up
    remove_index :users, :email
    remove_column :users, :coach_id
  end
end
