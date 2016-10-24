class Trip < ApplicationRecord
  before_create :set_city_details

  has_many :transportations, dependent: :destroy
  has_many :accomodations, dependent: :destroy
  has_and_belongs_to_many :users

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :destination, presence: true

  def set_city_details
    self.city_details = self.city_name + '-' + self.country_name
  end


  def days_number
    (self.end_date - self.start_date).to_i
  end

  def total_transportation
    sum = 0
    self.transportations.each do |transportation|
      sum += transportation.price
    end
    sum
  end

  def total_accomodation
    sum = 0
    self.accomodations.each do |acmd|
      sum += acmd.price
    end
    sum
  end

  def total_cost
    self.total_accomodation + self.total_transportation
  end

  def total_cost_per_traveler
    self.total_cost / self.users.count
  end


end
