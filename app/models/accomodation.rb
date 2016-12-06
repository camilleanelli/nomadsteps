class Accomodation < ApplicationRecord
  belongs_to :trip
  has_and_belongs_to_many :users

  validate :end_date_must_be_greater_than_start_date
  validates :accomodation_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :contact_email, format: { with: /\A^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$\z/ , message: "It is not an email" }, allow_blank: true
  validates :price, numericality: { greater_than_or_equal_to: 0, messsage: "It can't be a negativ number"}

  def end_date_must_be_greater_than_start_date
   errors.add(:end_date, ' must be greater than check-in date') if end_date <= start_date
  end

  def count_night
    (self.end_date - self.start_date).to_i
  end

  def price_per_personne
    @number = self.trip.users.count
    self.price / @number
  end

  def price_per_person_per_night
    (self.price / self.count_night) / @number
  end

  def total_accomodations
    self.price_per_personne * self.count
  end
end
