class Review < ActiveRecord::Base
  attr_accessible :content, :member_username, :product_id, :title,:reviewphoto
   has_attached_file :reviewphoto, :styles => { :medium => "200x200>", :thumb => "100x100>" }
   # attr_accessible :title, :body
 
   #Mapping between product and Reviews tables
     belongs_to :product
     belongs_to :member


       validates  :title,:presence=>true
            validates :content,:presence=>true
             validates :member_username,:presence=>true
            


            def self.search(search)
               if search
                 find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
               else
                 find(:all)
               end
             end

  
end
