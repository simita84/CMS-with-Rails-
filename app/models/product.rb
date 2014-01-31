class Product < ActiveRecord::Base
  #attr_accessible :title
  attr_accessible :title, :body
  
   #Mapping between product and Reviews tables
   has_many :reviews
  
    #belongs_to :admin
   
   validates_presence_of :title,:message=>"The title cannot be blank"
    
  
  validates_uniqueness_of :title,:message=>"Title already entered"
  
  
end
