class RemoveAdminIndexFromEvents < ActiveRecord::Migration
  def self.up
  	 remove_index("events","admin_username")
  	 remove_column("events","admin_username")

  end

  def self.down
  		add_column("events","admin_username")
  	 add_index("events","admin_username")

  end
end
