class ReviewsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
  
#U don't need edit or update as methods in my before filter 
#bc they aren't methods, right 

  def show  
  	@review = Review.find(params[:id])
  end

  def create
    load_product
  	@review = Review.new(
    	:comment    => params[:review][:comment], 
    	:product_id => @product.id, 
    	:user_id    => current_user.id
    )

  	# above is the same as @review = @product.reviews.build(params[:review])
    
    if @review.save
    	redirect_to products_path, notice: 'Review created successfully'
    else
    	render :action => :show
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end
    
  private

  def load_product
  	@product = Product.find(params[:product_id])
    #does paramas[:product_id] = 4, or whatever # the product is. This action is executed upon "CREATE" method
  end
end
