class Item < ActiveRecord::Base
  
  attr_accessible :itemphoto,:name,:content,:posted_by
    has_attached_file :itemphoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :itemphoto, 
                               :content_type => %w(image/jpeg image/jpg image/png  image/gif)

 


      validates :name,:presence => { :message => "missing " }
      validates :content,:presence => { :message => "missing" }
      




             def self.search(search)
                if search
                  find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
                else
                  find(:all)
                end
              end


end
