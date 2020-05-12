class UsersController < ApplicationController
	before_action :authenticate_user!
	def top
    end
	def index
		@book = Book.new
        @user = User.new
	end
	def list
	end
	def show

	end
	def new

    end
    def edit
   
    end
end


