class Book < ApplicationRecord
    validates :title, :author, :description, precense: true
    validates :year, precense: true, numericality: true
end
