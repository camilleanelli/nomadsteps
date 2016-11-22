class Transportation < ApplicationRecord
  belongs_to :trip
  has_many :tickets, dependent: :destroy
  has_and_belongs_to_many :users

  validate :end_date_must_be_greater_than_start_date
  validates :transportation_type, presence: true
  validates :departure_datetime, presence: true
  validates :arrival_datetime, presence: true
  validates :reference_number, presence: true
  validates :price, presence: true

  def end_date_must_be_greater_than_start_date
   errors.add(:arrival_datetime, ' must be greater than departure time') if arrival_datetime <= departure_datetime
  end

  def price_per_personne
    self.price / self.users.count
  end
end
