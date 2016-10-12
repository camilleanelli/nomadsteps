require 'rails_helper'

RSpec.describe "redirection of user", :type => :feature do
  it "redirect to profile complete page if user profil is not complete" do
    User.create(email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    visit "/"

    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"
    expect(current_path).to eq complete_profile_path

    fill_in 'First', with: "John"
    fill_in 'Last', with: "Doe"
    click_button 'Validate'

    expect(current_path).to eq trips_path
  end
end
