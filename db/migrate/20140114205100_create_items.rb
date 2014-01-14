class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.string :member_username

      t.timestamps
    end
  end
end
