class AddAttachmentReviewphotoToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :reviewphoto
    end
  end

  def self.down
    drop_attached_file :reviews, :reviewphoto
  end
end
