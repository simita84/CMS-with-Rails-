class Recipe < ActiveRecord::Base
   
  attr_accessible :recipephoto,:title, :content,:member_username
   has_attached_file :recipephoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  
  #Mapping between Member and Recipes tables
    belongs_to :member
 
end
