class HomesController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  def index
    showHome
    render('showHome')
  end

  def showHome
    @homes=Home.all
  end

   
  
 #Create new home page content.
      def new
        @home=Home.new
      end

      def createHome
        @home=Home.new(params[:home]) 
        
        #Save the object
          if @home.save
        #If save succeeds redirect to list 
        flash[:notice]= "Home --created successfully"
          redirect_to(:action=>'index')
        #else redislay the form so user can fix the problem
          else
            flash[:notice]= "Home cannot be added. "
              render('editHome')
          end
      end
 

  def editHome
     #Find the object using form parameters
     @home=Home.find(params[:id])
     end

  def updateHome
       #Find the object using form parameters
       @home=Home.find(params[:id])
       #update with new values
       @home.update_attributes(params[:home])
       #Save the object
       if @home.save
         #If update succeeds redirect to list 
         flash[:notice]= "Home --"+@home.title+"--updated successfully"
         redirect_to(:action=>'index')
       else
          flash[:notice]= "Home"+ @home.title+" cannot be updated. "
         render('editHome')
       end
       end
  


   def deleteHome
             #Find the object using form parameters
             @home=Home.find(params[:id])
             end
           def destroyHome
                #Find the object using form parameters
                @home=Home.find(params[:id])
                 if @home.destroy
                   flash[:notice]="Home deleted successfully"
                    redirect_to(:action =>'index')  
                    else
                       flash[:notice]="Home cannot be deleted"   
                 end
           end
  
  
end
