class AddUnitsperpackageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :unitsperpackage, :float
  end
end
