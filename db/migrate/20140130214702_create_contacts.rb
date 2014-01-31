class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name,:null=>false
      t.string :emailid,:null=>false
      t.string :facebook,:null=>false

      t.timestamps
    end
  end
  
  def self.down
    drop_table :contacts
  end
end