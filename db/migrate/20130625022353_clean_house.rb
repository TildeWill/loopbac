class CleanHouse < ActiveRecord::Migration
  def up
    drop_table :notes
    drop_table :simple_feedbacks
  end

  def down
    raise "No going back"
  end
end
