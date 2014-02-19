class Contact < ActiveRecord::Base
  attr_accessible :name, :emailid, :facebook

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

validates :name, :presence => { :message => "missing" },
          :length => { :maximum => 50 }

    
 validates :emailid, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX

end
