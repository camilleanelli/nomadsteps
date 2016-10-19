class Accomodation < ApplicationRecord
  belongs_to :trip

  validates :accomodation_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_persons, presence: true

  def count_night
    (self.end_date - self.start_date).to_i
  end

  def price_per_personne
    @number = self.trip.users.count
    self.price / @number unless @number == nil
  end

  def price_per_person_per_night
    (self.price / self.count_night) / self.number_of_persons unless @number == nil
  end

  def total_accomodations
    self.price_per_personne * self.count
  end
end
