class BooksController < ApplicationController

before_action :authenticate_user!

    def new
    end
    
    def create
        @user_list = User.find(current_user.id)
        @book_list = Book.new(book_params)
        @books = Book.all
        book = @book_list
        book.user_id = current_user.id
        if book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(book.id)
        else
            @book = book
            render action: :index
        end
    end
    
    def index
        @books = Book.all
        @user_list = User.find(current_user.id)
        @book_list = Book.new
    end
    
    def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
        @user_list = User.find(current_user.id)
        @book_list = Book.new
    end
    
    def edit
        @book = Book.find(params[:id])
        unless @book.user == current_user
           redirect_to books_path
        end
    end
    
    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(book)
        else
            @book = book
            render action: :edit
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Book was successfully destroyed."
        redirect_to books_path
    end
    
    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
    
end
