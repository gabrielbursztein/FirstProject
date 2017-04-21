class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :book
  belongs_to :user
end
