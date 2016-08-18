class Transportation < ApplicationRecord
  belongs_to :trip

  validates :transportation_type, presence: true
  validates :departure_datetime, presence: true
  validates :arrival_time, presence: true
  validates :reference_number, presence: true

end
