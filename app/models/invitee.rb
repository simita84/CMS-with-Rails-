class Invitee < ActiveRecord::Base
  attr_accessible :title, :body,:event_id,:firstname, :email,:invited,:response,:adults,:kids,:message
   belongs_to :event

   before_save {|  invitee| invitee.email = invitee.email.downcase}

 EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

validates :email, :presence => {:message=>"missing"}, :length => { :maximum => 100 },:format => EMAIL_REGEX
 	  
validates :firstname, :presence => {:message=>"missing"}, :length => { :maximum => 30 }

end