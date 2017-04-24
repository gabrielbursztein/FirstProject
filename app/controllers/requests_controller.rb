# Requests Controller
class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = current_user.requests
  end

  def create
    @book = Book.find(params[:book_id])
    @request = @book.requests.create(user: current_user)
  end
end
