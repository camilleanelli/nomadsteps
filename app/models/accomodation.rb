class Accomodation < ApplicationRecord
  belongs_to :trip

  def count_night
    (self.end_date - self.start_date).to_i
  end

  def price_per_personne
    self.price / self.number_of_persons
  end

  def price_per_person_per_night
    (self.price / self.count_night) / self.number_of_persons
  end

  def total_accomodations
    self.price * self.count
  end
end
