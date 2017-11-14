class AddLocationToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :location, :string
  end
end
