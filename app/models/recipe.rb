class Recipe < ActiveRecord::Base
  attr_accessible :content, :member_username, :title
  
  
  #Mapping between Member and Recipes tables
    belongs_to :member
 
end
