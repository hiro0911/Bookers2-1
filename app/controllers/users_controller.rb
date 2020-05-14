class UsersController < ApplicationController

	def create
       @user = current_user
	    if @user.save
	       redirect_to users_path(@user.id), notice: 'User was successfully created.'
	    else
	       redirect_to users_path(@user.id), notice: "error"
		end

    end
	def top
    end
	def index
		@book = Book.new
		@books = Book.all
       	@user = User.find(params[:id])

	end
	def show
	    @book = Book.find(params[:id])
	    @user = current_user
	    @books = Book.all
	end
	def new
		@users = User.all.order(created_at: :desc)
		@user = current_user
    end
    def edit
   		@user = current_user

    end
	def update
		@book = Book.new
	    @user = current_user
	      if@user.update(user_params)
  	        render :index, notice: "successfully"
  	      else
  	      	render :index, notice: "error"
  	      end
  	end
	private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)

	end

end