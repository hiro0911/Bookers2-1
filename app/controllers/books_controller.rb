class BooksController < ApplicationController
		before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}

		def create
		    @book = Book.new(book_params)
	     	@book.user_id = current_user.id
		if  @book.save
  # 作成に成功した場合、 /books/{book_id} にリダイレクト
  			redirect_to users_path(current_user.id)
		else
  # 作成に失敗した場合、 /books/new に戻してバリデーションエラーを表示する
 			 render template: "users/index"
  # view 側で、 @book.errors を使ってエラーを表示する。
		end
		end
        def ensure_correct_user
            @book = Book.find(params[:id])
    	end
        def show
	        @user = current_user
	        @book = Book.find(params[:id])
	        @books = Book.new
	    end
	    def index
	    	@books = Book.all.order(created_at: :desc)
	    	@book = Book.new
	    	@user = User.new
	    	@users = User.all
	    end
	    def destroy
		    @book = Book.find(params[:id])
		    @book.destroy
		    redirect_to books_path
		end
        private
        def book_params
        params.require(:book).permit(:title, :body, :user)
        end

end
