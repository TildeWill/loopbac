class CreateMetaFeedback < ActiveRecord::Migration
  def change
    create_table :meta_feedback do |t|
      t.integer :author_id
      t.integer :feedback_id
      t.integer :kindness_score
      t.integer :actionability_score
      t.integer :specificity_score

      t.timestamps
    end
  end
end
