require 'rails_helper'

RSpec.describe "edit a trip", @javascript, :type => :feature do
  it 'redirect to index of trips' do
    user = User.create(first_name: "John", last_name: "Doe", email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    trip =  Trip.create(destination: "Paris", start_date: "24/11/2016", end_date: "30/11/2016", city_name: "Paris", country_name: "France", person_number: 2)
    user.trips << trip
    visit "/"

    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"

    visit '/trips'
    click_link 'Paris'




  end
end
