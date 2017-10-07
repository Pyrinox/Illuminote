class AddChildrenIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :children_id, :integer
  end
end
