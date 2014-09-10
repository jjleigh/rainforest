perclass ProductsController < ApplicationController
  before_filter :ensure_logged_in, :except => [:show, :index]

  def index
    # if params[:search]
    #   @products = Product.search(params[:search])

    #     if @products.size.zero?
    #   # :notice => "No results found"
    #       flash.now[:alert] = "No results found"
    #   # redirect_to pictures_url, :notice => "No results found"
    #       @products = Product.order('products.created_at DESC').page(params[:page])
    #     end

    # else

      @products = Product.order('products.created_at DESC').page(params[:page])

      respond_to do |format|
        format.html #allows the controller to respond to Javascript
        format.js
      end
    # end
  end

  def show
  	@product = Product.find(params[:id])

   
      @review = @product.reviews.build

  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)
    @product.user_id =current_user.id
  	if @product.save
  		redirect_to @product
  	else
  		render :new
  	end 
  end 

  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes(products_params)
  		redirect_to products_path(@product)
  	else
  		render :edit
  	end
  end 

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents, :image)
  end
end
