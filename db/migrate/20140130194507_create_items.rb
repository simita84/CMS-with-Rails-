class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
    	t.string :name,:limit=>100,:null=>false
    	t.text :content,:null=>false
    	t.string :posted_by,:null=>false
        t.timestamps
    end

	end
 
def self.down
  	drop_table :items
end
 


 end