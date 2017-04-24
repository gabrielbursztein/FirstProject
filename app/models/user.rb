# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :requests
  has_many :books, through: :requests
  ratyrate_rater

  def requested?(book)
    books.include? book
  end

  def request_status(book)
    requests.where(book_id: book.id).pluck(:status).first.titleize
  end
end
