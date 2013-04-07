class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.references :user
      t.string :about_email
      t.text :details
      t.timestamps
    end
  end
end