class ReviewsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
  before_filter :load_product

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html {redirect_to product_path(@product.id), notice: 'Review created successfully.'}
        format.js {} #This will look for app/views/reviews/create.js.erb
      else 
       format.html{render 'products/show', alert: "There was an error."}
       format.js {} # This will look for app/views/reviews/create.js.erb
      end 
    end 
  end
  
  def show
    @review = Review.find(params[:id])
  end

  def destroy
  	@review = Review.destroy

  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
