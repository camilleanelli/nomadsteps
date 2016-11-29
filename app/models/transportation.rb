class Transportation < ApplicationRecord
  belongs_to :trip
  has_many :tickets, dependent: :destroy
  has_and_belongs_to_many :users

  validates :user_ids, presence: true
  validates :departure_city, presence: true
  validates :transportation_type, presence: true
  validates :departure_datetime, presence: true
  validates :price, presence: true



  def price_per_personne
    self.price / self.users.count
  end
end
