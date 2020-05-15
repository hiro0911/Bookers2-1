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
	        @user = User.current_user
	        @book = Book.find(params[:id])
	        @users = User.all.order(created_at: :desc)
	    end
	    def edit
		  	@book = Book.find(params[:id])
		    if @book.user_id != current_user.id
		      flash[:notice] = "can't successfully access!"
		      redirect_to user_path(@book.user_id)
		    end
        end
	    def update
	    	@book = Book.find(params[:id])
	    	  if@book.update(book_params)
	    	    redirect_to book_path, notice: "successfully"
	    	  else
	    	  	render edit, notice: "error"
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
            params.require(:book).permit(:title,:body)
        end

end
