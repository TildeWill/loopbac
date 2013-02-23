class AddSubjectEmailToLoop < ActiveRecord::Migration
  def change
    add_column :loops, :subject_email, :string
  end
end
