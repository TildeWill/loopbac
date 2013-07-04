class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :author_id
      t.integer :subject_id
      t.integer :position
      t.integer :rank_category_id

      t.timestamps
    end
  end
end
