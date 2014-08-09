class ReviewsController < ApplicationController
  layout 'admin'
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  before_filter :find_product
  
  def index
    
    listReviews
    render('listReviews')
  end

  def listReviews
  @reviews = Review.order("reviews.id DESC").where(:product_id=>@product.id)
   
  end
  
  
  def new
       @review=Review.new(:product_id=>@product.id)
      
  end
  def createReview
    #Instantiate a new object using for parameters
           @product=Product.find_by_id(params[:product_id])
           @review=Review.new(params[:review])
            
            admin=Admin.find_by_username(session[:username])
            @review.update_attributes(:posted_by=>admin.emailId,:product_id=>@product.id)
  #Save the object
         if @review.save    
   #If save succeeds redirect to list 
  # flash[:notice]= "Review for  --"+@review.title+"--added successfully"
          flash[:notice]= "Review added successfully"
          redirect_to(:action=>'index', :product_id => @review.product_id)
  #else redislay the form so user can fix the problem
         else
              flash[:warning]= "Review cannot be added. "
             render('new')
         end
     end
  
  
 
  
  def editReview
    #Find the object using form parameters
    @review=Review.find(params[:id])
    @review_count=Review.count
    @products=Product.order('id DESC')
    end

 def updateReview
      #Find the object using form parameters
      @review=Review.find(params[:id])
      #update with new values
      @review.update_attributes(params[:review])
      #Save the object
      if @review.save
        #If update succeeds redirect to list 
        flash[:notice]= "Review for --"+@review.title+"--updated successfully"
        redirect_to(:action=>'index',:id=>@review.id,:product_id=>@product.id)
      else
        #if save fails ,rediplay the form so user can fix problems
        flash[:warning]= "Review for  cannot be updated. "
        @review_count=Review.count
        @products=Product.order('id ASC')
        render('editReview')
      end
  end
        def deleteReview
          #Find the object using form parameters
          @review=Review.find(params[:id])
          end
        def destroyReview
             #Find the object using form parameters
             @review=Review.find(params[:id])
              if @review.destroy
                flash[:notice]="Review for   "+@review.title+" deleted successfully"
                 redirect_to(:action =>'index',:product_id=>@product.id)  
                 else
                    flash[:warning]="Review for    "+@review.title+" cannot be deleted"   
              end
        end

  private 
  
  def find_product
    if (params[:product_id])
      @product=Product.find_by_id(params[:product_id])
  end
end

end
