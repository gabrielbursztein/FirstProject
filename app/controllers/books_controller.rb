# Books Controller
class BooksController < ApplicationController
  helper_method :book
  before_action :authenticate_user!

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { render json: { data: @books }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { data: book }, status: :ok }
    end
  end

  def new
    @authors = Author.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      flash.now[:error] = @book.errors
      @authors = Author.all
      render :new
    end
  end

  def book
    @book ||= Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author_id,
      :description,
      :year,
      :image
    )
  end
end
