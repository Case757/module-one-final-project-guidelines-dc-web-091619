class RemoveNameColumnFromListitemsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :list_items, :name, :string
  end
end
