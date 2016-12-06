class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_and_belongs_to_many :transportations
  has_and_belongs_to_many :accomodations
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, source: :user
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def first_name_capitalize
    self.first_name.capitalize
  end

  def current_trip
    trips.current.first
  end

  def next_trips
    trips.next
  end

  def last_trips
    trips.past
  end

  def last_trips
    last_trips = []
    if @current_trip == nil
      self.trips.each do |trip|
        if trip.end_date < Date.today
          last_trips << trip
        end
      end
      last_trips
    else
      self.trips.each do |trip|
        if trip.end_date < @current_trip.start_date
          last_trips << trip
        end
      end
      last_trips
    end
  end

end
