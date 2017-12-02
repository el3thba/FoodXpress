class Posts < ActiveRecord::Migration[5.1]

    def change
  	  	create_table :posts do |t|
     	 	t.text :title
     		t.text :text
     	end
    end
end
