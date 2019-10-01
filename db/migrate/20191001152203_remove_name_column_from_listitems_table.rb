class RemoveNameColumnFromListitemsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :listitems, :name
  end
end
