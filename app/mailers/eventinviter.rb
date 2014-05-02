class Eventinviter < ActionMailer::Base
  default from: "momsntotsbayarea@gmail.com"

    def eventinvite(invitees,event) 
      @invitees = invitees
      @event = event
      #@url  = "http://localhost:3000/invitees?event_id=#{@event.id}"
      #@url  = "http://localhost:3000/eventdetails?event_id=#{@event.id}"

       if Rails.env.development?
        @url = "http://localhost:3000/eventdetails?event_id=#{@event.id}"
       else
        @url = "https://murmuring-garden-1315.herokuapp.com/eventdetails?event_id=#{@event.id}"
       end 


      emails = @invitees.collect(&:email).join(",")
   #  def eventinvite 
      @invitees.each  do |mem|
        #mail( :to => emails, :reply_to => 'momsntotsbayarea@gmail.com', :subject => "Invite from Momsntots")
        mail( :to => emails, :reply_to => 'momsntotsbayarea@gmail.com', :subject => "Greetings !! You have been invited to #{@event.name}")
       end 
    end
end
