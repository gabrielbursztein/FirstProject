class BooksController < ApplicationController
    
    helper_method :book

    def index
      @books = Book.all
    end

    def create
      @book = Book.create(book_params)
      redirect_to @book
    end
    
    def book
      @book ||= Book.find(params[:id])
    end

    private
      def book_params
        params.require(:book).permit(:title, :author, :description, :year)
      end
end
