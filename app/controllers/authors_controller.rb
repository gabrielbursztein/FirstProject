class AuthorsController < ApplicationController

  def index
    respond_to do |format| 
      format.html
      format.json {render json: {data:Author.all}, status: :ok}
    end
  end

  def create 
    author = Author.create(book_params)
  end

  private
  def book_params
    params.require(:author).permit(:name)
  end
end
