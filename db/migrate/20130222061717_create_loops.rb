class CreateLoops < ActiveRecord::Migration
  def change
    create_table :loops do |t|
      t.string :coach_id
      t.string :subject_id
      t.string :subject_first_name
      t.string :subject_last_name

      t.text :reviewer_emails
      t.date :reviewer_due_date
      t.date :subject_due_date
      t.date :coach_due_date
      t.timestamps
    end
  end
end
