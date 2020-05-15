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
	    @user = current_user
 	    @books = @user.books.order(created_at: :desc)

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
   		    if @user.id != current_user.id
         flash[:notice] = "can't successfully access!"
         redirect_to user_path(current_user.id)
    end
    end
	def update
	   @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully update user!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
	private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)

	end

end