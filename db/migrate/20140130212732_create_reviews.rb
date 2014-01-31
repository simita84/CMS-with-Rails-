
class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :product_id,:null=>false
      t.string :title,:null=>false
      t.text :content,:null=>false
      t.string :posted_by,:null=>false

      t.timestamps
    end
     add_index("reviews","product_id")
       
  end
  def self.down
    drop_table :reviews
  end
end
