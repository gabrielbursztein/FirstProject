class Request < ApplicationRecord
  enum status: [:pending, :denied, :approved]
  belongs_to :book
  belongs_to :user
  validates :book, :user, :status, presence: true
end
