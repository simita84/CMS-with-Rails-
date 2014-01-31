
class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :title,:null=>false
      t.text :content,:null=>false

      t.timestamps
    end
  end
end
