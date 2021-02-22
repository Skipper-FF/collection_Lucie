class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.references :factory, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.references :pattern, null: false, foreign_key: true
      t.string :name
      t.string :reference
      t.integer :quantity
      t.integer :confection_cost
      t.integer :total_cost
      t.integer :selling_price

      t.timestamps
    end
  end
end
