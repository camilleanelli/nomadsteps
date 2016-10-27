class Accomodation < ApplicationRecord
  belongs_to :trip

  validate :end_date_must_be_greater_than_start_date
  validates :accomodation_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_persons, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def end_date_must_be_greater_than_start_date
   errors.add(:end_date, ' must be greater than check-in date') if end_date <= start_date
  end

  def count_night
    (self.end_date - self.start_date).to_i
  end

  def price_per_personne
    @number = self.number_of_persons
    self.price / @number
  end

  def price_per_person_per_night
    (self.price / self.count_night) / self.number_of_persons unless @number == nil
  end

  def total_accomodations
    self.price_per_personne * self.count
  end
end
