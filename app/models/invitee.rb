class Invitee < ActiveRecord::Base
  attr_accessible :title, :body,:event_id,:firstname, :email,:invited,:response,:adults,:kids,:message
   belongs_to :event

  # before_save {|  invitee| invitee.email = inviteee.email.downcase}

 #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

 #validates :email, :presence => true, :length => { :maximum => 100 },:format => EMAIL_REGEX, :uniqueness => {:case_sensitive => false}



   # validates_presence_of :email,:message=>"The Email cannot be blank"
# validates_presence_of :firstname,:message=>"The Guest Name cannot be blank"

  # validates_uniqueness_of :email,:message=>"Email already added"



end