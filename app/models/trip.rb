class Trip < ApplicationRecord
  has_many :transportations, dependent: :destroy
  has_many :accomodations, dependent: :destroy
  has_and_belongs_to_many :users

  def days_number
    (self.end_date - self.start_date).to_i
  end
end
