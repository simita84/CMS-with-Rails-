class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :eventphoto,:name,:datetime,:duration,:address,:description
  
  #has_attached_file :eventphoto, :styles => { :medium => "500x500>", :thumb => "70x70>" }


  if Rails.env.production?
  has_attached_file :eventphoto, :styles => { :medium => "500x500>", :thumb => "70x70>" }
  else
   has_attached_file :eventphoto, 
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :url =>"/assets/events/:id/:style/:basename.:extension",
      :path =>":rails_root/public/assets/events/:id/:style/:basename.:extension"
  end




  validates_attachment_content_type :eventphoto, 
                              :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
  
 
  has_many :invitees
  
  
  
   validates :name, :presence => { :message => "missing" }, :length => { :maximum => 150 }
    validates :datetime, :presence => { :message => "missing" }
     validates :duration, :presence => { :message => "missing" }
     validates :address, :presence => { :message => "missing" }
     validates :description, :presence => { :message => "missing" }
    
    
    
  
  
end
