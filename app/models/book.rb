class Book < ApplicationRecord
    validates :title, :author, :description, presence: true
    validates :year, presence: true, numericality: true
    has_many :requests
end
