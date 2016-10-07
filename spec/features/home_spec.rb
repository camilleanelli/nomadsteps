require 'rails_helper'

describe "title home page", :type => :feature do


  it "signs me in" do
    visit '/'
    expect(page).to have_content 'NomadSteps'
  end
end
