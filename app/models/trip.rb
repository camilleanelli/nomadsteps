class Trip < ApplicationRecord
  geocoded_by :full_destination
  after_validation :geocode, if: :full_destination_changed?

  has_many :transportations, dependent: :destroy
  has_many :accomodations, dependent: :destroy
  has_and_belongs_to_many :users

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :destination, presence: true



 def full_destination
   "#{destination}, #{country}"
 end

 def full_destination_changed?
   destination_changed? || country_changed?
 end
 
  def days_number
    (self.end_date - self.start_date).to_i
  end
end
