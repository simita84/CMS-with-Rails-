class RenamingMemberUsernameToPostedByInAll < ActiveRecord::Migration
  def self.up

   rename_column("items","member_username","posted_by")
   rename_column("reviews","member_username","posted_by")
   rename_column("recipes","member_username","posted_by")
   

  end

  def self.down
  	rename_column("items","posted_by","member_username")
    rename_column("reviews","posted_by","member_username")
    rename_column("recipes","posted_by","member_username")
   
  end
end
