class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :product_id
      t.string :title
      t.text :content
      t.string :member_username

      t.timestamps
    end
     add_index("reviews","product_id")
      add_index("reviews","member_username")
  end
  def self.down
    drop_table :reviews
  end
end
