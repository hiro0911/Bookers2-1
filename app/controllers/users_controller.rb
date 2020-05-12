class UsersController < ApplicationController
	def top
    end
	def index
		@book = Book.new
		@users = User.all
        @user = User.new 
	end
	def list
	end
	def show
    	
	end
end
