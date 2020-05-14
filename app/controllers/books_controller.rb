class BooksController < ApplicationController
		

		def create
		    @book = Book.new(book_params)
	     	@book.user_id = current_user.id
		if  @book.save
  # 作成に成功した場合、 /books/{book_id} にリダイレクト
  			redirect_to users_path(current_user.id), notice: "successfully"
		else
  # 作成に失敗した場合、 /books/new に戻してバリデーションエラーを表示する
 			redirect_to users_path(current_user.id), notice: "error"
  # view 側で、 @book.errors を使ってエラーを表示する。
		end
		end
		
        def destroy
		  @book = Book.find(params[:book_id])
		  if@book.destroy
		    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
		    format.json { head :no_content }
		  else
		    redirect_to users_path, notice: "error"
		  end
		  
        def show
	        @user = User.current_user
	        @book = Book.find(params[:id])
	        @users = User.all.order(created_at: :desc)
	    end
	    def edit
	    	@book = Book.find(params[:id])
	    	@book.update(book_params)
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
            params.permit(:title, :body, :user_id)
        end

end
