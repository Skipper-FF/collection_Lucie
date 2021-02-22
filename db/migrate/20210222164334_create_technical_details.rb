class CreateTechnicalDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :technical_details do |t|
      t.references :clothe, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
