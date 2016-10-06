require 'rails_helper'

describe "title home page", :type => :feature do


  it "signs me in" do
    visit '/'
    save_and_open_page
    expect(page).to have_content 'NomadSteps'
  end
end
