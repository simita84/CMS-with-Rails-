class Recipe < ActiveRecord::Base
   
   attr_accessible :recipephoto,:title, :content,:posted_by
   has_attached_file :recipephoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  
 
    
    
      validates :title,:presence => true
      
     validates  :content,:presence => true
       
     validates :posted_by, :presence => true
    
    
    
       def self.search(search)
         if search
           find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
         else
           find(:all)
         end
       end
 
end

 