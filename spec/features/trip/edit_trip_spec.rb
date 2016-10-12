require 'rails_helper'

RSpec.describe "edit a trip",  :type => :feature do
  it 'redirect to index of trips' do
    User.create(first_name: "John", last_name: "Doe", email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    visit "/"

    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"

    visit '/trips'
    click_button 'Edit trip'
    
  end
end
