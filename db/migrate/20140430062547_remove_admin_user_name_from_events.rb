class RemoveAdminUserNameFromEvents < ActiveRecord::Migration
  def self.up
  	remove_column :events, :admin_username
  end

  def self.down
  	add_column :events, :admin_username
  end
end
