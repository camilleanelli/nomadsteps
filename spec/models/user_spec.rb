require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:old_trip) { create(:trip, destination: "Nevers", start_date: 20.days.ago, end_date: 5.days.ago) }
  let(:current_trip1) { create(:trip, destination: "Paris", start_date: 2.days.ago, end_date: 2.days.from_now)}
  let(:current_trip2) { create(:trip, destination: "Versaille", start_date: 1.days.ago, end_date: 1.days.from_now )}
  let(:next_trip) { create(:trip, destination: "Pekin", start_date: 10.days.from_now, end_date: 15.days.from_now)}

  describe '#current_trip' do
    it 'works' do
      user.trips = [ old_trip, current_trip1, current_trip2, next_trip ]
      expect(user.current_trip).to eq current_trip2
    end
  end

  describe '#next_trips' do
    it 'works' do
      user.trips = [ old_trip, current_trip1, current_trip2, next_trip ]
      expect(user.next_trips).to eq [next_trip]
    end
  end

  describe '#last_trips' do
    it 'works' do
      user.trips = [ old_trip, current_trip1, current_trip2, next_trip ]
      expect(user.last_trips).to eq [old_trip]

    end
  end
end
