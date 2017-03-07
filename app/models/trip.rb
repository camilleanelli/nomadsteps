class Trip < ApplicationRecord
  has_many :transportations, dependent: :destroy
  has_many :accomodations, dependent: :destroy
  has_and_belongs_to_many :users

  validate :end_date_must_be_greater_than_start_date
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :destination, presence: true
  # validates :city_name, presence: true
  scope :current, -> {
    where("start_date <= ? AND end_date > ?", Date.today, Date.today).order(:end_date)
  }
  scope :next, -> { where("start_date > ?", Date.today).order(:start_date) }
  scope :past, -> { where("end_date < ?", Date.today).order(:end_date)
  }

  def end_date_must_be_greater_than_start_date
   errors.add(:end_date, ' must be greater than start date') if end_date <= start_date
  end


  def destination
    "#{self.city_name}, #{self.country_name}"
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
