class AddForeignIdColumnsToListitems < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :item_id, :integer
    add_column :list_items, :list_id, :integer
  end
end
