class CommentsController < ApplicationController
 
  helper_method :book

  def create
    @comment = book.comments.create(comment_params)
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:rate, :description)
  end

end
