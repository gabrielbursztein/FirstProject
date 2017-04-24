# Comments Controller
class CommentsController < ApplicationController
  helper_method :book

  def create
    @comment = book.comments.create(comment_params.merge(
                                      user_id: current_user.id
    ))
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
