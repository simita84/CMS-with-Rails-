class Item < ActiveRecord::Base
  
  attr_accessible :itemphoto,:name,:content,:posted_by
    has_attached_file :itemphoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }

      


        validates_presence_of :name,:message=>"The name cannot be blank"
             validates_presence_of :content,:message=>"The content cannot be blank"



             def self.search(search)
                if search
                  find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
                else
                  find(:all)
                end
              end


end
