class AddProducttypeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :producttype, :string
  end
end
