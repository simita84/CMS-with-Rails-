require 'aws/s3'
class Recipe < ActiveRecord::Base
   
   attr_accessible :recipephoto,:title, :content,:posted_by

  if Rails.env.production?
    has_attached_file :recipephoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  else
   has_attached_file :recipephoto, 
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :url =>"/assets/recipes/:id/:style/:basename.:extension",
      :path =>":rails_root/public/assets/recipes/:id/:style/:basename.:extension"
  end


# Model Validations
  validates_attachment_content_type :recipephoto,  :content_type => %w(image/jpeg image/jpg image/png image/gif)
  validates :title,:presence => { :message => "missing" }
  validates  :content,:presence => { :message => "missing" }     
  validates :posted_by, :presence => { :message => "missing" }
    
    
 
    
       def self.search(search)
         if search
           find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
         else
           find(:all)
         end
       end
 
end

 