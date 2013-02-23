class RemoveDatesFromLoop < ActiveRecord::Migration
  def up
    remove_column :loops, :reviewer_due_date
    remove_column :loops, :subject_due_date
    remove_column :loops, :coach_due_date
  end

  def down
    add_column :loops, :reviewer_due_date, :date
    add_column :loops, :subject_due_date, :date
    add_column :loops, :coach_due_date, :date
  end
end
