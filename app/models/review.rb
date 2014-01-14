class Review < ActiveRecord::Base
  attr_accessible :content, :member_username, :product_id, :title
  
  
  #Mapping between product and Reviews tables
    belongs_to :product
    belongs_to :member
  
end
