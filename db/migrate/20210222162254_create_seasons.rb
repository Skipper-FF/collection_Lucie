class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :begining_date
      t.date :ending_date
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
