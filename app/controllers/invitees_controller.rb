class InviteesController < ApplicationController
 
   layout 'admin'
  before_filter :find_event
     before_filter :confirm_logged_in
 

    def index
      listInvitees
  render('listInvitees')
  end

def listInvitees

 @invitees = Invitee.where(:event_id => @event.id, :invited => false).paginate(page:params[:page],per_page: 3) 
 @invitedinvitees = Invitee.where(:event_id => @event.id, :invited => true).paginate(page:params[:page],per_page: 5) 
    end
 



   def eventinfo
   # @invitees = Invitee.where(:event_id => @event.id)
    @invitedinvitees = Invitee.where(:event_id => @event.id, :invited => true)
    @events = Event.where(:id => @event.id)
    @invitee = Invitee.where(:event_id => @event.id, :invited => true, :email => session[:email_id]).first

   end 



    def new
      #@events = Event.all
     @event=Event.find_by_id(@event.id)
      @invitee = Invitee.new(:event_id => @event.id)

    end


    def create
        # Instantiate a new object using form parameters

        @invitee = Invitee.new(params[:invitee])
        @invitee.update_attributes(:event_id=>@event.id)
        # Save the object
        if @invitee.save
          # If save succeeds, redirect to the list action
          flash[:warning] = "********* Invitee Added ************"
          redirect_to(:action => 'index', :event_id => @invitee.event_id)
        else
          # If save fails, redisplay the form so user can fix problems
          #@event_count = Event.count + 1
          flash[:notice] = "Sorry, Invitee cannot  be added, Please check the fields and try again"
          @error_message = "It seems there was a validation error. Please try again."
          render('new')
        end
    end
    
    
    def edit
      #Find the object using form parameters
       @invitee=Invitee.find(params[:id])
    end
     def update
        #Find the object using form parameters
        @invitee=Invitee.find(params[:id])
        #update with new values
        @invitee.update_attributes(params[:invitee])
        #Save the object
        if @invitee.save
          #If update succeeds redirect to list 
          flash[:notice]= "Invitee --"+@invitee.email+"--updated successfully"
          redirect_to(:action=>'index', :event_id => @invitee.event_id)
        else
           flash[:notice]= "Invitee"+ @invitee.email+" cannot be updated. "
          render('edit')
        end
      end
    
        
        def delete
           #Find the object using form parameters
           @invitee=Invitee.find(params[:id])
           end
         def destroy
              #Find the object using form parameters
              @invitee=Invitee.find(params[:id])
               if @invitee.destroy
                 flash[:notice]="Invitee   "+@invitee.email+" deleted successfully"
                  redirect_to(:action =>'index')  
                  else
                     flash[:notice]="Invitee   "+@invitee.email+" cannot be deleted"   
               end
         end
      

    def sendEventInvite
      @invitees = Invitee.where(:event_id => @event.id, :invited => false)
      ## message = "Email sent!"
        if @invitees && @event
          Eventinviter.eventinvite(@invitees,@event).deliver
        end 
        flash[:warning] = "********* Email Sent ************"
         redirect_to(:action =>'index', :event_id => @event.id)
         
          @invitees.each do |invitee|
          invitee.update_attributes(:invited => true)
      end  

    end 
 

    def memberResponseHandler
      @invitee = Invitee.find(params[:id])
      @invitee.update_attributes(params[:invitee])
      @invitee.responded = true
      @invitee.save
      redirect_to(:action => 'eventinfo', :event_id => @event.id)
     
    end  




  private

  def find_event
    if params[:event_id]
      @event = Event.find_by_id(params[:event_id])
    end
  end
  
  


  
end
