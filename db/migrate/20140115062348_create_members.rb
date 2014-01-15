
class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
       t.string "username",:limit=>50,:null=>false
       t.string "first_name"
       t.string "last_name"
       t.string "hashed_password",:null=>false
       t.string "salt"
      t.timestamps
    end
     add_index("members","username")
  end
  
  def self.down
    drop_table :members  
  end
  
end



 