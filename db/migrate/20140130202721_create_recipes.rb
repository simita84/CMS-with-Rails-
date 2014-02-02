class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title ,:null=>false,:limit=>100
    	t.text :content ,:null=>false
    	t.string :posted_by,:null=>false

      t.timestamps
    end
end
    def self.down
      # instratuction for changing db back to previous state
      drop_table :recipes
    end
 
end
