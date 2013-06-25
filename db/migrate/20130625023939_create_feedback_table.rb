class CreateFeedbackTable < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.integer :subject_id
      t.integer :author_id
      t.text :content
      t.timestamps
    end
  end
end
