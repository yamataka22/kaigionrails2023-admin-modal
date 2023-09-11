class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :stock
      t.integer :price
      t.string :description
      t.integer :status
      t.date :sale_start_date
      t.date :sale_end_date
      t.string :memo

      t.timestamps
    end
  end
end
