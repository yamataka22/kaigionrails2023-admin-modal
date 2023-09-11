class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category
      t.integer :stock, null: false
      t.integer :price, null: false
      t.string :description
      t.integer :status, null: false, default: 0
      t.date :sale_start_date
      t.string :memo

      t.timestamps
    end
  end
end
