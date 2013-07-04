class CreateRankCategories < ActiveRecord::Migration
  def change
    create_table :rank_categories do |t|
      t.integer :position
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
