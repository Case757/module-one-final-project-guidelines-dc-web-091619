class AddForeignIdColumnsToListitems < ActiveRecord::Migration[6.0]
  def change
    add_column :listitems, :item_id, :integer
    add_column :listitems, :list_id, :integer
  end
end
