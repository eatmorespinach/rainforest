class ReviewsController < ApplicationController
	before_filter :load_product
  
  def show
  	@review = Review.find(params[:id])
  end

  def create
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
  	@product = Product.find(:product_id)
  end
end
