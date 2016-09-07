class CreateReviews < ActiveRecord::Migration
  def change
  	create_table :reviews do |t|
  		t.integer :rating, null: false
  		t.string  :body, null: false 
  		t.references :restaurant, null: false
  		t.references :user , null: false   

  		t.timestamps null: false
  	end
  end
end
