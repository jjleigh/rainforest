class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :descriotion
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
