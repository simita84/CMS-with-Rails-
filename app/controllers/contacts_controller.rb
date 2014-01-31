class ContactsController < ApplicationController
  
  layout 'admin'
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  def index
        showContact
        render('showContact')

  end

  def showContact
     @contacts=Contact.all
   end

    
      def newContact

        @contact=Contact.new
      end

      def createContact
        @contact=Contact.new(params[:contact]) 
        
        #Save the object
          if @contact.save
        #If save succeeds redirect to list 
        flash[:notice]= "Contact created successfully"
          redirect_to(:action=>'index')
        #else redislay the form so user can fix the problem
          else
            flash[:notice]= "Contact cannot be added. "
              render('newContact')
          end
      end
 

  def editContact
     #Find the object using form parameters
     @contact=Contact.find(params[:id])
     end

  def updateContact
       #Find the object using form parameters
       @contact=Contact.find(params[:id])
       #update with new values
       @contact.update_attributes(params[:contact])
       #Save the object
       if @contact.save
         #If update succeeds redirect to list 
         flash[:success]= "Contact updated successfully"
         redirect_to(:action=>'index')
       else
          flash[:warning]= "Contact cannot be updated. "
         render('editContact')
       end
       end
  


   def deleteContact
             #Find the object using form parameters
             @contact=Contact.find(params[:id])
             end
           def destroyContact
                #Find the object using form parameters
                @contact=Contact.find(params[:id])
                 if @contact.destroy
                   flash[:success]="Contact deleted successfully"
                    redirect_to(:action =>'index')  
                    else
                       flash[:warning]="Contact cannot be deleted"   
                 end
           end
  
  
end
