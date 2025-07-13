class CreateUtilityReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :utility_readings do |t|
      t.string :resource
      t.date :date
      t.decimal :value
      t.decimal :unit_price

      t.timestamps
    end
  end
end
