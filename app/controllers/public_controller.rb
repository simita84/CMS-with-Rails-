class PublicController < ApplicationController
  layout 'application'
  
    before_filter :find_product
  def index
     @homes=Home.all
  end

  def login
     render('login')
  end

  def attempt_login
     member=Member.authorize(params[:username],params[:password])
        if member 
          #storing session info
            session[:member_id]=member.id
            session[:username]=member.username

          #Giving message of succesful login
            flash[:notice]="You re logged in to Clubby kids"

          #directing to authorized pages
           redirect_to(:controller=>"member",:action=>'index')

        else
          flash[:notice]="Not able to  log in,please try again"
            redirect_to(:controller=>'public',:action=>'login')
        end
  end

  def listProducts
     @products=Product.order("products.created_at DESC").paginate(:page => params[:page],:per_page =>50)
      @reviews = Review.order("reviews.created_at DESC").paginate(:page => params[:page],:per_page =>5)
       
  end

  def listReviews
     @products=Product.order("products.created_at DESC")
     @reviews = Review.order("reviews.created_at DESC").where(:product_id=>@product.id).paginate(:page => params[:page],:per_page =>1) 
   
   
end

  def listRecipes
    # @recipes=Recipe.order("recipes.created_at DESC").page(params[:recipe])
      # @recipes=Recipe.order("recipes.created_at DESC")
       # @users = User.search(query).page(params[:user_page])

       @recipes = Recipe.order("recipes.created_at DESC").paginate(:page => params[:page],:per_page =>2)
          @allrecipes=Recipe.order("recipes.created_at DESC")
  end

  def listItems
     
      @items = Item.order("items.created_at DESC").paginate(:page => params[:page],:per_page =>3)
      @allItems=Item.order("items.created_at DESC")
    
  end

  def listContacts
     @contacts=Contact.all
  end
 #-------------member registration-----------
  def newMember
     @member = Member.new
  end
  
  def showMember
   # raise params.inspect
    @member = Member.find_by_id(params[:id])
  end  

  def createMember
    @member = Member.new(params[:member])
    if @member.save
      
     #session[:member_id]=@member.id
     #session[:username]=@member.username
  
     #flash[:success] = 'Welcome to Momsntots.'
   
   # redirect_to(:controller=>"member",:action=>'index')
       
    sendemailToMember
   flash[:success] = 'Please verify the account'
   redirect_to(:controller=>"public",:action=>'index')
   
  # Signup.registration_email(@member).deliver
   else
     render('newMember')
    end

   # Emailer.registration_email(@member).deliver
  end


  def sendemailToMember

    if @member
      Signup.registration_email(@member).deliver
    end  
  end
  
  #-------------member registration-----------
  
  
  
  
   private 

   def find_product
     if (params[:product_id])
       @product=Product.find_by_id(params[:product_id])
   end
   end
   
  
  
end
