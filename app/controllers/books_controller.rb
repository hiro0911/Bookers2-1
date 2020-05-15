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
			  @book.destroy
			  flash[:notice]="successfully delete!"
			  redirect_to books_path
		end

        def show
			    @book = Book.find(params[:id])
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
        if @book.update(book_params)
           flash[:notice] = "You have creatad book successfully."
           redirect_to  book_path(@book.id)
        else
           @books = Book.all
           flash[:notice]= ' errors prohibited this obj from being saved:'
           render "edit"
           end
  	    end
	    def index
	    	@books = Book.all.order(created_at: :desc)
	        @user = current_user
            @book = Book.new
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
