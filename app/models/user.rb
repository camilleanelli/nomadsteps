class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_many :transportations, through: :trips
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, source: :user
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable


  def current_trips
    current_trips = []
    self.trips.each do |trip|
      current_trips.push trip if trip.start_date < Date.today && trip.end_date > Date.today
    end
    current_trips
  end

end
