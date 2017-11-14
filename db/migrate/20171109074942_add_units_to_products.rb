class AddUnitsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :units, :string
  end
end
