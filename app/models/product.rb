class Product < ActiveRecord::Base
  attr_accessible :id, :title
  
   #Mapping between product and Reviews tables
  has_many :reviews
  
end
