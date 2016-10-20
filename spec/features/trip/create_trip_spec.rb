require 'rails_helper'

RSpec.describe "create trip", @javascript, :type => :feature do
  it 'have notice message to confirm the new trip' do
    user = User.create(first_name: "John", last_name: "Doe", email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    visit "/"
    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"
    visit '/trips'
    save_and_open_page
    click_link 'ADD MY FIRST TRIP'
    select "2016", :from => 'trip_start_date_1i'
    select "December", :from => 'trip_start_date_2i'
    select "17", :from => 'trip_start_date_3i'
    select "2016", :from => 'trip_end_date_1i'
    select "December", :from => 'trip_end_date_2i'
    select "24", :from => 'trip_end_date_3i'
    fill_in "Where do you go ?", with: "Paris"
    click_button 'Validate'
    expect(page).to have_content "Your trip has been successfully created"
  end
end
