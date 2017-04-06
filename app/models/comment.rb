class Comment < ApplicationRecord
  validates :rate, :description, presence: true
  belongs_to :book
end
