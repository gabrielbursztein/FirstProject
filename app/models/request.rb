# Request Model
class Request < ApplicationRecord
  enum status: %i[pending denied approved]
  belongs_to :book
  belongs_to :user
  validates :book, :user, :status, presence: true
end
