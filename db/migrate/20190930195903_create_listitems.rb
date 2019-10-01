class CreateListitems < ActiveRecord::Migration[6.0]
  def change
    create_table :listitems do |t|
      t.string :name
    end
  end
end
