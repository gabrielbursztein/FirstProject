class Comment < ApplicationRecord
  validates :rate, :description, presence: true
  belongs_to :book
  belongs_to :user
end
