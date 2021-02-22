class CreatePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :description
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
