

class AdminsController < ApplicationController
  layout 'admin'
   before_filter :confirm_logged_in,:except => [:login,:attempt_login]
      def index
        listAdmins
        render('listAdmins')
      end

       #List all the admin users
      def listAdmins

       @admins=Admin.order("admins.created_at DESC").paginate(:page => params[:page],:per_page =>10)
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
             flash[:success]= "Admin details for --"+@admin.last_name+"--updated successfully"
             redirect_to(:action=>'index')
           else
              flash[:warning]= "Admin details for"+ @admin.last_name+" cannot be updated. "
             render('editAdmin')
           end
           end

            

  
  
end
