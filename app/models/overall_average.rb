# Rating Overall Average Model
class OverallAverage < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
end
