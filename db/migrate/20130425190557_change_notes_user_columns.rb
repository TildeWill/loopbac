class ChangeNotesUserColumns < ActiveRecord::Migration
  def up
    rename_column :notes, :user_id, :author_id
    add_column :notes, :subject_id, :integer
    remove_column :notes, :about_email
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
