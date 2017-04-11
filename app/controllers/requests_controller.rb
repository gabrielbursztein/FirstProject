class RequestsController < ApplicationController

  def index
    user_signed_in? ? @requests = current_user.requests : redirect_to(new_user_session_path)
  end

  def create
    @book = Book.find(params[:book_id])
    @request = @book.requests.create(user_id: current_user.id)
  end
end
