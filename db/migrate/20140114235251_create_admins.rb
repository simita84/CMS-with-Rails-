class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :emailId
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
