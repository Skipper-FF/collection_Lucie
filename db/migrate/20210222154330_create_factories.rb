class CreateFactories < ActiveRecord::Migration[6.0]
  def change
    create_table :factories do |t|
      t.string :name
      t.string :address
      t.string :speciality
      t.integer :production_capacity
      t.integer :moq
      t.integer :rating

      t.timestamps
    end
  end
end
