require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#current_trips' do
    it 'works' do
      user =  create(:user)
      old_trip = create(:trip, destination: "Nevers", start_date: 20.days.ago, end_date: 5.days.ago)
      current_trip = create(:trip, destination: "Paris", start_date: 2.days.ago, end_date: 2.days.from_now)
      next_trip = create(:trip, destination: "Pekin", start_date: 10.days.from_now, end_date: 15.days.from_now)
      user.trips << old_trip
      user.trips << current_trip
      user.trips << next_trip
      expect(user.current_trips).to eq [current_trip]
      expect(user.email).to eq "johndoe@email.com"
    end
  end
end
