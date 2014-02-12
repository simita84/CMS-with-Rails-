class RecipesController < ApplicationController
  
  layout 'admin'
   before_filter :find_recipe
   before_filter :confirm_logged_in,:except => [:login,:attempt_login,:listPublicRecipes]
   
   def index
     listRecipes
     render('listRecipes')
   end

   def listRecipes
     @recipes=Recipe.order("recipes.created_at DESC").paginate(page: params[:page],per_page: 10)
     
   end
  
   def listRecipe
      @recipes=Recipe.order("recipes.created_at DESC").where(:id=>@recipe.id)       
     
   end
   
     
   def new
     @recipe=Recipe.new
   end
   
   def createRecipe
     @recipe=Recipe.new(params[:recipe]) 
      
    #Find admin using the admin session name
  admin=Admin.find_by_username(session[:username])
         #updating with admin email id
  @recipe.update_attributes(:posted_by=>admin.emailId)
 
     #Save the object
       if @recipe.save
     #If save succeeds redirect to list 
     flash[:success]= "Recipe --"+@recipe.title+"--created successfully"
       redirect_to(:action=>'index')
     #else redislay the form so user can fix the problem
       else
         flash[:warning]= "Recipe  "+ @recipe.title+"  cannot be added. "
           render('new')
       end
   end
   
 
 def editRecipe
   
   @recipe=Recipe.find(params[:id])
   
 end
 
  def updateRecipe
       #Find the object using form parameters
       @recipe=Recipe.find(params[:id])
       #update with new values
       @recipe.update_attributes(params[:recipe])
       #Save the object
       if @recipe.save
         #If update succeeds redirect to list 
         flash[:success]= "Recipe --"+@recipe.title+"--updated successfully"
         redirect_to(:action=>'index')
       else
          flash[:warning]= "Recipe"+ @recipe.title+" cannot be updated. "
         render('editRecipe')
       end
       end

  def deleteRecipe
         #Find the object using form parameters
         @recipe=Recipe.find(params[:id])
         end
       def destroyRecipe
            #Find the object using form parameters
            @recipe=Recipe.find(params[:id])
             if @recipe.destroy
               flash[:success]="Recipe   "+@recipe.title+" deleted successfully"
                redirect_to(:action =>'index')  
                else
                   flash[:warning]="Recipe   "+@recipe.title+" cannot be deleted"   
             end
       end

        
  
        private 

        def find_recipe
          if (params[:id])
            @recipe=Recipe.find_by_id(params[:id])
        end
      end
  
  
  
  
end
