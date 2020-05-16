class BooksController < ApplicationController
 before_action :authenticate_user!




	def create
        @book = Book.new(book_params)
    	@book.user_id = current_user.id
  	  if  @book.save
  		flash[:notice] = "successfully created book!"
     	redirect_to book_path(id: @book.id)
    else
      flash[:notice] = 'error'
      redirect_to books_path
    end
    end

    def show
	    @new_book = Book.new
	    @book = Book.find(params[:id])
	    @user = @book.user
    end

    def index
        @user = current_user
        @books = Book.all.order(created_at: :desc)
        @book = Book.new
    end

    def edit
    	@book = Book.find(params[:id])
    	redirect_to books_path if @book.user_id != current_user.id
    end


    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        flash[:notice] = "You have creatad book successfully."
        redirect_to  book_path(@book.id)

        else
        @books = Book.all
         flash[:notice]= ' error prohibited this obj from being saved:'
        render :edit
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
     end


	private

    def book_params
        params.require(:book).permit(:title, :body)
    end

     def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
   end
end

