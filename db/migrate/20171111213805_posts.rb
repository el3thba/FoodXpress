class Posts < ActiveRecord::Migration[5.1]

    def change
  	  	create_table :posts do |t|
     	 	t.string :title
     		t.text :text
     	
    end
end
