class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name,:limit=>50,:null=>false
      t.string :last_name,:limit=>50,:null=>false
      t.string :username,:limit=>50,:null=>false
      t.string :emailId,:null=>false
      t.string :hashed_password
      t.string :salt
      t.timestamps
    end
     add_index("admins","username")
  end

  def self.down
      # instratuction for changing db back to previous state
      drop_table :admins
    end
end
