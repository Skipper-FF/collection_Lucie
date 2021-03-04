class AddColorToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :color_hexadecimal, :string
  end
end

