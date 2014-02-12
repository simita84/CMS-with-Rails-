class VerifymembersToMembers < ActiveRecord::Migration
 def self.up
    add_column("members", "verified_user", :boolean, :default => false)
  end

  def self.down
    remove_column("members", "verified_user")
  end
end
