class ManageMembersController < ApplicationController
  
   before_filter :confirm_logged_in
   layout 'admin'
   #--------------Creating Members----------------

     def listMembers
       @members=Member.order("members.created_at DESC").paginate(:page => params[:page],:per_page =>3)

     end

     def newMember
       @member=Member.new
     end


     def createMember
       @member=Member.new(params[:member]) 

       #Save the object
         if @member.save
       #If save succeeds redirect to list 
       flash[:notice]= "Member --"+@member.username+"--created successfully"
         redirect_to(:action=>'listMembers')
       #else redislay the form so user can fix the problem
         else
           flash[:notice]= "Member "+ @member.username+" cannot be added. "
             render('newMember')
         end
     end
     
      def editMember
          #Find the object using form parameters
          @member=Member.find(params[:id])
          end

       def updateMember
            #Find the object using form parameters
            @member=Member.find(params[:id])
            #update with new values
            @member.update_attributes(params[:member])
            #Save the object
            if @member.save
              #If update succeeds redirect to list 
              flash[:notice]= "Member details for --"+@member.last_name+"--updated successfully"
              redirect_to(:action=>'listMembers')
            else
               flash[:notice]= "Member details for"+ @member.last_name+" cannot be updated. "
              render('newMember')
            end
            end



             def deleteMember
               #Find the object using form parameters
               @member=Member.find(params[:id])
               end
             def destroyMember
                  #Find the object using form parameters
                  @member=Member.find(params[:id])
                   if @member.destroy
                     flash[:notice]="Member   "+@member.first_name+" deleted successfully"
                      redirect_to(:action =>'list')  
                      else
                         flash[:notice]="Member   "+@member.first_name+" cannot be deleted"   
                   end
             end

#-----------------------------------------------------------------

  
end
