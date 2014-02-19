  class PublicController < ApplicationController
  layout 'application'
  
    before_filter :find_product
  def index
     @homes=Home.all
  end


#-----------------------Managing Member Login from Public Page-----------------------
  def login
     render('login')
  end


  def attempt_login
     member=Member.authorize(params[:username],params[:password])
        if member && member.verified_user
          #storing session info
            session[:member_id]=member.id
            session[:username]=member.username

          if params[:remember_me]
             cookies.permanent[:auth_token] = member.auth_token
          else
             cookies[:auth_token] = member.auth_token
          end

          #Giving message of succesful login
            flash[:success]="You re logged in to Clubby kids"

          #directing to authorized pages
           redirect_to(:controller=>"member",:action=>'index')

        else
          flash[:alert]="Invaid Username and password combination,Please try again. Or you have not activated your account yet."
            redirect_to(:controller=>'public',:action=>'login')
        end
  end


#-----------------------End of Managing Member Login from Public Page-----------------------


  def listProducts
     @products=Product.order("products.created_at DESC").paginate(:page => params[:page],:per_page =>50)
      @reviews = Review.order("reviews.created_at DESC").paginate(:page => params[:page],:per_page =>5)
       
  end

  def listReviews
     @products=Product.order("products.created_at DESC")
     @reviews = Review.order("reviews.created_at DESC").where(:product_id=>@product.id).paginate(:page => params[:page],:per_page =>2) 
   
   
end

  def listRecipes
    # @recipes=Recipe.order("recipes.created_at DESC").page(params[:recipe])
      # @recipes=Recipe.order("recipes.created_at DESC")
       # @users = User.search(query).page(params[:user_page])

       @recipes = Recipe.order("recipes.created_at DESC").paginate(:page => params[:page],:per_page =>5)
          @allrecipes=Recipe.order("recipes.created_at DESC")
  end
  
  #-------------searchRecipes-------------------------
  def searchRecipes
    
    if (!params[:search].blank?)
       @recipes_Result = Recipe.search(params[:search]).paginate(:page => params[:page],:per_page =>5)
       render( 'searchRecipes')
      
     else
     redirect_to(:controller=>"public",:action=>'listRecipes')
      
   end
  end
  
  #-------------searchReviews-------------------------
  def searchReviews
    
    if (!params[:search].blank?)
       @reviews_Result = Review.search(params[:search]).paginate(:page => params[:page],:per_page =>5)
       render( 'searchReviews')
      
     else
     redirect_to(:controller=>"public",:action=>'listProducts')
      
   end
  end
  
  #-------------searchItems-------------------------
  def searchItems
    
    if (!params[:search].blank?)
       @items_Result = Item.search(params[:search]).paginate(:page => params[:page],:per_page =>5)
       render( 'searchItems')
      
     else
     redirect_to(:controller=>"public",:action=>'listItems')
      
   end
  end
   
  def listItems
     
      @items = Item.order("items.created_at DESC").paginate(:page => params[:page],:per_page =>5)
      @allItems=Item.order("items.created_at DESC")
    
  end

  def listContacts
     @contacts=Contact.all
  end
 #-------------Member Sign Up / registration from Public Page-----------
  def new
     @member = Member.new
     
  end
  
  def showMember
   # raise params.inspect
    @member = Member.find_by_id(params[:id])
  end  

  def createMember
    @member = Member.new(params[:member])
    if @member.save
      sendemailToMember
      flash[:success] = ' Please confirm your email address by clicking the link that we just send to you in  email'
     redirect_to(:controller=>"public",:action=>'index')

  def verifymember
         @member = Member.find_by_auth_token!(params[:auth_token])
         @member.verified_user = true
         @member.save
         redirect_to root_path, :notice => "Your account has been activated. 
         Please sign-in with your email_id."
       end
     
     
     
      
     #session[:member_id]=@member.id
     #session[:username]=@member.username
  
     #flash[:success] = 'Welcome to Momsntots.'
   
   # redirect_to(:controller=>"member",:action=>'index')
       
    
  # Signup.registration_email(@member).deliver
   else
     render('new')
    end

   # Emailer.registration_email(@member).deliver
  end


  def sendemailToMember

    if @member
      Signup.registration_email(@member).deliver
    end  
  end

  
  


 #-------------Member Sign Up / registration from Public Page-----------

 
  
  #--------Contact Admin-------------

 

def sendemailToAdmin

  

end


  
  
   private 

   def find_product
     if (params[:product_id])
       @product=Product.find_by_id(params[:product_id])
   end
   end
   
  
  
end
