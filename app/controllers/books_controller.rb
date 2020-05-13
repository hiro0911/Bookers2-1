class BooksController < ApplicationController
		def create
		    @book = Book.new(book_params)
	     	@book.user_id = current_user.id
		if  @book.save
  # 作成に成功した場合、 /books/{book_id} にリダイレクト
  			redirect_to edit_book_path(@book.id)
		else
  # 作成に失敗した場合、 /books/new に戻してバリデーションエラーを表示する
 			 render template: "users/index"
  # view 側で、 @book.errors を使ってエラーを表示する。
		end

        end
        def show
		    @book = book.find(params[:id])
	    end
	    def index

	    end
        private
        def book_params
            params.require(:book).permit(:name, :body, :user_id)
        end
end
