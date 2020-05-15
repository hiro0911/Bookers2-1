class BooksController < ApplicationController


		def create
		    @book = Book.new(book_params)
		  	@book.user_id = current_user.id
		  	if @book.save
		  		flash[:notice] = "successfully created book!"
		     	redirect_to book_path(id: @book.id)
		    else
		      @user = current_user
		      @books = Book.all.order(created_at: :desc)
		      render :index
		    end
		end

        def destroy
		      book = Book.find(params[:id])
			  book.destroy
			  flash[:notice]="successfully delete!"
			  redirect_to books_path
		end

        def show
		  	  	@booker = Book.find(params[:id])
			    @user = current_user
			    @book= Book.new
	    end
	    def edit
		  	@book = Book.find(params[:id])
		    if @book.user_id != current_user.id
		      flash[:notice] = "can't successfully access!"
		      redirect_to user_path(@book.user_id)
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
	    def index
	    	@books = Book.all.order(created_at: :desc)
	    	@book = Book.new
	    	@user = User.new
	    	@users = User.all
	    end


        private
          def book_params
        params.require(:book).permit(:title, :body)
	    end

	     def user_params
	        params.require(:user).permit(:name,:profile_image,:introduction)
	     end

	     def  ensure_current_user
	      @book = Book.find(params[:id])
	     if @book.user_id != current_user.id
	        redirect_to books_path
	     end
  end

end
