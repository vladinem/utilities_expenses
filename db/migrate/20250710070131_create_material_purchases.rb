class CreateMaterialPurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :material_purchases do |t|
      t.string :item
      t.date :date
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
