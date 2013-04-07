class AddResponsesToLoops < ActiveRecord::Migration
  def change
    add_column :loops, :responses, :text
  end
end
