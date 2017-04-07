class RequestsController < ApplicationController

  def index
    @requests = current_user.requests
  end

  def create
    @book = Book.find(params[:book_id])
    @request = @book.requests.create(user_id: current_user.id)
  end

end
