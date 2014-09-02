class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) 
  	if 	@user.save
  		redirect_to products_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(params[:id])

    if current_user
      @my_products = @user.products
    end 
  end
  
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
