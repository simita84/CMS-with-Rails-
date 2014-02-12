class Review < ActiveRecord::Base
  attr_accessible :content, :posted_by, :product_id, :title,:reviewphoto
   has_attached_file :reviewphoto, :styles => { :medium => "200x200>", :thumb => "100x100>" }
    validates_attachment_content_type :reviewphoto, 
                              :content_type => %w(image/jpeg image/jpg image/png image/gif)
  

   # attr_accessible :title, :body
 
   #Mapping between product and Reviews tables
     belongs_to :product
    # belongs_to :member
     #  belongs_to :admin


        validates  :title,:presence => { :message => "missing" }
        validates :content,:presence => { :message => "missing" }
       
            
 






            def self.search(search)
               if search
                 find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
               else
                 find(:all)
               end
             end

  
end
