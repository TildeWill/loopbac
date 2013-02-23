class ChangeLoops < ActiveRecord::Migration
  def up
    remove_column :loops, :coach_email
    remove_column :loops, :subject_email
    remove_column :loops, :subject_first_name
    remove_column :loops, :subject_last_name
    remove_column :loops, :reviewer_emails

    add_column :loops, :email, :string
    add_column :loops, :question_type, :string
    add_column :loops, :created_by_email, :string
  end

  def down
  end
end
