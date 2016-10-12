require 'rails_helper'

RSpec.describe "create a trip",  :type => :feature do
  it "it redirect to the trips index page when a trip is created" do
    User.create(first_name: "John", last_name: "Doe", email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    visit "/"

    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"

    visit 'trips/new'
    select 2016, from: 'Start date'
    # select 'October', from: 'Start date'
    # select '25', from: 'Start date'
    select 2016, from: 'End date'
    # select '11', from: 'End date'
    # select '4', from: 'End date'
    fill_in 'Where do you go ?', with: 'paris'
    click_button 'Validate'
    expect(current_path).to eq trips_path
    expect(page).to have_content '2016'
  end
end
