class RenameFeedbackToSimpleFeedback < ActiveRecord::Migration
  def up
    rename_table :feedback, :simple_feedbacks
    rename_column :simple_feedbacks, :user_id, :author_id
    add_column :simple_feedbacks, :subject_id, :integer
    remove_column :simple_feedbacks, :about_email
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
