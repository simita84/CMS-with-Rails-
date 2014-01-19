class AlterEventsTodeleteString < ActiveRecord::Migration
  def self.up
    remove_column("events","string")
  end

  def self.down
    add_column("events","string")
  end
end
