class RenameIdsInLoops < ActiveRecord::Migration
  def change
    rename_column :loops, :subject_id, :subject_email
    rename_column :loops, :coach_id, :coach_email
  end
end
