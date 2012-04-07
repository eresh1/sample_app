class UsersController < ApplicationController

  def show
	@user = User.find(params[:id])
	@title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      	#Chapt8 Exercise 2
      	@user.password = ""
      	@user.password_confirmation = ""
      	#End Exercise 2

      render 'new'
      
	
    end
  end
end
