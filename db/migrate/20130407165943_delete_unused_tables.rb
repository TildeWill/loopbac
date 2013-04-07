class DeleteUnusedTables < ActiveRecord::Migration
  def up
    drop_table :loops
  end

  def down
    raise "Never give up, never surrender"
  end
end
