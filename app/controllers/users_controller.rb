class UsersController < ApplicationController



	def top
  end
	def index
	    @book = Book.new
	    @user = current_user
 	    @books = Book.all.order(created_at: :desc)

	end
	def show
	    @book = Book.new
	    @user = User.find(params[:id])
	    @books = @user.books.order(created_at: :desc)

	end
	def new
		@user = current_user
		@book = Book.new
		@users = User.all.order(created_at: :desc)
    end
    def edit
	         @user = User.find(params[:id])
        if @user.id != current_user.id
          flash[:notice] = "can't successfully access!"
          redirect_to user_path(current_user.id)
        end
    end
	def update
         @user = User.find(params[:id])
       if  @user.update(user_params)
        flash[:notice] = "You have updated user successfully."

        redirect_to "/users/#{current_user.id}"
        else
        flash[:notice] = " errors prohibited this obj from being saved:"
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





end