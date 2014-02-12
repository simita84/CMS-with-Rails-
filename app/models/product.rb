class Product < ActiveRecord::Base
  #attr_accessible :title
  attr_accessible :title, :body
  
   #Mapping between product and Reviews tables
   has_many :reviews
  
    #belongs_to :admin
   
    validates :title, :presence => { :message => "missing" },
   				:uniqueness => {:case_sensitive => false}


end
