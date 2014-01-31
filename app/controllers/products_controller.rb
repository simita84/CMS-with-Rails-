class ProductsController < ApplicationController
  layout 'admin'
  
  
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  def index
      listProducts
    render('listProducts')
  end

  def listProducts   
   @products=Product.order("products.created_at DESC").paginate(page:params[:page],per_page: 10) 
  end
  
  def newProduct
     
    @product=Product.new()
  end
  
  def createProduct
    #Instantiate a new object using for parameters
      @product=Product.new(params[:product])
    #Save the object
      if @product.save
    #If save succeeds redirect to list 
    flash[:notice]= "Product --"+@product.title+"--added successfully"
      redirect_to(:action=>'index')
    #else redislay the form so user can fix the problem
      else
        flash[:notice]= "Product"+ @product.title+" cannot be added. "
          render('newProduct')
      end
  end
  def editProduct
    #Find the object using form parameters
    @product=Product.find(params[:id])
    end

 def updateProduct
      #Find the object using form parameters
      @product=Product.find(params[:id])
      #update with new values
      @product.update_attributes(params[:product])
      #Save the object
      if @product.save
        #If update succeeds redirect to list 
        flash[:notice]= "Product --"+@product.title+"--updated successfully"
        redirect_to(:action=>'index')
      else
         flash[:notice]= "Product"+ @product.title+" cannot be updated. "
        render('editProduct')
      end
      end
  
      def deleteProduct
        #Find the object using form parameters
        @product=Product.find(params[:id])
        end
      def destroyProduct
        # Event.find(params[:id]).destroy
           #Find the object using form parameters
           @product=Product.find(params[:id])
            if @product.destroy
             flash[:notice]="Product   "+@product.title+" deleted successfully"
               redirect_to(:action =>'index')  
               else
                  flash[:warning]="Product   "+@product.title+" cannot be deleted"   
            end
      end
  
  
  
end
