class AddProductiondateToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :productiondate, :date
  end
end
