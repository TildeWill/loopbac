class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :about_email
      t.text :details
      t.timestamps
    end
  end
end
