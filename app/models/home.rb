class Home < ActiveRecord::Base
  attr_accessible :title, :content




 validates :title, :presence => { :message => "missing" },
          :length => { :maximum => 50 }

validates :content, :presence => { :message => "missing" }

end
