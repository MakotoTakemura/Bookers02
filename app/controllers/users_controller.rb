class UsersController < ApplicationController
    
before_action :authenticate_user!
   
    def index
        @users = User.all
        @user_list = User.find(current_user.id)
        @book_list = Book.new
    end
    
    def show
        @user_list = User.find(params[:id])
        @book_list = Book.new
        @books = @user_list.books.reverse_order
    end
    
    def edit
        @user = User.find(params[:id])
        unless @user == current_user
           redirect_to user_path(current_user)
        end
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] = "User was successfully updated."
           redirect_to user_path(@user.id)
        else
           render action: :edit
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
    
end


