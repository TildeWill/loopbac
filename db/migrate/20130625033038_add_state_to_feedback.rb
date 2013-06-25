class AddStateToFeedback < ActiveRecord::Migration
  def change
    add_column :feedback, :state, :string
  end
end
