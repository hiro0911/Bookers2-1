class UsersController < ApplicationController

	def top
    end
	def index
	    @book = Book.new
	    @user = current_user
 	    @books = @user.books.order(created_at: :desc)

	end
	def show
	    @book = Book.new
	    @user = User.find(params[:id])
	    @books = @user.books
	end
	def new
		@users = User.all.order(created_at: :desc)
		@user = current_user
    end
    def edit
	    @user = User.find(params[:id])

    end
	def update
	   @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "successfully update user!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
	private
     def book_params
        params.require(:book).permit(:title, :body)
    end

    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end

    def  ensure_current_user
        @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to user_path(current_user.id)

     end
  end

end