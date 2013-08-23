class AddManagesPeopleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manages_people, :boolean
  end
end
