# Book Model
class Book < ApplicationRecord
  has_many :requests
  has_many :comments
  belongs_to :author
  mount_uploader :image, BookImageUploader
  ratyrate_rateable 'general'
  validates :title, :description, :image, :author, presence: true
  validates :year, presence: true, numericality: true
  validate :year_margins

  def year_margins
    return false if year.nil?
    return false unless year.between? 1700, Time.current.year
    errors.add(:year, 'year must be between 1700 and ' +
      Time.current.year.to_s)
  end
end
