class CreateListitems < ActiveRecord::Migration[6.0]
  def change
    create_table :listitems do |t|
      t.name :name
    end
  end
end
