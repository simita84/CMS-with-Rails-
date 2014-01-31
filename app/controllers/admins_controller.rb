class AdminsController < ApplicationController
  layout 'admin'
  
      def index
        listAdmins
        render('listAdmins')
      end

       #List all the admin users
      def listAdmins

       @admins=Admin.order("admins.created_at DESC").paginate(:page => params[:page],:per_page =>10)
      end

       #Create new    admin users
      def newAdmin

        @admin=Admin.new
      end

      def createAdmin
        @admin=Admin.new(params[:admin]) 
        
        #Save the object
          if @admin.save
        #If save succeeds redirect to list 
        flash[:notice]= "Admin --"+@admin.username+"--created successfully"
          redirect_to(:action=>'index')
        #else redislay the form so user can fix the problem
          else
            flash[:notice]= "Admin "+ @admin.username+" cannot be added. "
              render('newAdmin')
          end
      end
      
      
      
      def editAdmin
         #Find the object using form parameters
         @admin=Admin.find(params[:id])
         end

      def updateAdmin
           #Find the object using form parameters
           @admin=Admin.find(params[:id])
           #update with new values
           @admin.update_attributes(params[:admin])
           #Save the object
           if @admin.save
             #If update succeeds redirect to list 
             flash[:notice]= "Admin details for --"+@admin.last_name+"--updated successfully"
             redirect_to(:action=>'index')
           else
              flash[:notice]= "Admin details for"+ @admin.last_name+" cannot be updated. "
             render('editAdmin')
           end
           end

           def deleteAdmin
             #Find the object using form parameters
             @admin=Admin.find(params[:id])
             end
           def destroyAdmin
                #Find the object using form parameters
                @admin=Admin.find(params[:id])
                 if @admin.destroy
                   flash[:notice]="Admin   "+@admin.first_name+" deleted successfully"
                    redirect_to(:action =>'index')  
                    else
                       flash[:notice]="Admin   "+@admin.first_name+" cannot be deleted"   
                 end
           end


       

  
  
end
