class AddProductbrandToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :productbrand, :string
  end
end
