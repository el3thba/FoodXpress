class AddProductdiscriptionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :productdiscription, :string
  end
end
