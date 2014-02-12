class ItemsController < ApplicationController
  layout 'admin'
    
    before_filter :find_item
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
     

     def index
       listItems
       render('listItems')
     end

     def listItems
 
      @items=Item.order("items.created_at DESC").paginate(page: params[:page],per_page: 10) 
     end

     def listItem
      @items=Item.order("items.created_at DESC").where(:id=>@item.id)
      end

     def new

       @item=Item.new
     end

     def createItem
       #Instantiate a new object using for parameters
         @item=Item.new(params[:item])
         #Find admin using the admin session name
         admin=Admin.find_by_username(session[:username])
         #updating with admin email id
          @item.update_attributes(:posted_by=>admin.emailId)
       #Save the object
         if @item.save
       #If save succeeds redirect to list 
       flash[:success]= "Item --"+@item.name+"--added successfully"
         redirect_to(:action=>'index')
       #else redislay the form so user can fix the problem
         else
           flash[:warning]= "item"+ @item.name+" cannot be added. "
             render('new')
         end
     end
     def editItem
       #Find the object using form parameters
       @item=Item.find(params[:id])
       end

    def updateItem
         #Find the object using form parameters
         @item=Item.find(params[:id])
         #update with new values
         @item.update_attributes(params[:item])
         #Save the object
         if @item.save
           #If update succeeds redirect to list 
           flash[:success]= "item --"+@item.name+"--updated successfully"
           redirect_to(:action=>'index')
         else
            flash[:warning]= "item"+ @item.name+" cannot be updated. "
           render('editItem')
         end
         end

         


 def deleteItem
               #Find the object using form parameters
               @item=Item.find(params[:id])
  end

      def destroyItem
                  #Find the object using form parameters
                  @item=Item.find(params[:id])
                   if @item.destroy
                     flash[:success]="Item   "+@item.name+" deleted successfully"
                      redirect_to(:action =>'index')  
                      else
                        flash[:warning]="Item   "+@item.name+" cannot be deleted"   
                   end
             end

  
         private 

         def find_item
           if (params[:id])
             @item=Item.find_by_id(params[:id])
         end
       end
  
end

 