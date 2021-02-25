class CreateFactoryFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :factory_families do |t|
      t.references :factories, null: false, foreign_key: true
      t.references :families, null: false, foreign_key: true

      t.timestamps
    end
  end
end
