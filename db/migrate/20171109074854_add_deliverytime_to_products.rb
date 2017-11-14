class AddDeliverytimeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :deliverytime, :string
  end
end
