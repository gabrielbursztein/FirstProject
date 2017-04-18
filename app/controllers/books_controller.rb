class BooksController < ApplicationController

    helper_method :book
    before_action :authenticate_user!

    def index
      @books = Book.all
      respond_to do |format| 
        format.html
        format.json {render json: {data: @books}, status: :ok}
      end  
    end

    def show
      respond_to do |format| 
        format.html
        format.json {render json: {data:book}, status: :ok}
      end
    end

    def new
      @authors = Author.all
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
        params.require(:book).permit(:title, :author_id, :description, :year, :image)
      end
end
