class CreateEvents < ActiveRecord::Migration
  
  def self.up
      # instructions for changing db to new state
       create_table :events do |t|
          t.string "name", :limit => 150
          t.datetime "datetime",:null=>false
          t.integer "duration", :limit => 150
          t.string "address", :limit => 400
          t.text "description"
          t.string "admin_username", :null=>false
          t.timestamps
       end
          add_index("events","admin_username")
    end   

     def self.down
      # instratuction for changing db back to previous state
      drop_table :events
    end
end




