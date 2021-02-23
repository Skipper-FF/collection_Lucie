class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :element_type
      t.string :supplier
      t.string :name
      t.string :reference
      t.string :description
      t.string :color
      t.string :composition
      t.string :unit
      t.string :unit_price
      t.integer :rating

      t.timestamps
    end
  end
end
