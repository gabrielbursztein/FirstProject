class Book < ApplicationRecord
    validates :title, :description, :image, presence: true
    validates :year, presence: true, numericality: true
    has_many :requests
    has_many :comments
    belongs_to :author
    mount_uploader :image, BookImageUploader
end
