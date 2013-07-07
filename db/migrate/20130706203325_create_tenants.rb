class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :domain

      t.timestamps
    end

    add_column :users, :tenant_id, :integer
    add_column :feedback, :tenant_id, :integer
    add_column :meta_feedback, :tenant_id, :integer
    add_column :rank_categories, :tenant_id, :integer
    add_column :rankings, :tenant_id, :integer
  end
end
