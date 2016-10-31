require 'spec_helper'

feature 'View listing' do
  scenario 'user can view list of properties' do
    visit '/spaces'
    expect(page).to have_content 'Super Cool House'
    expect(page).to have_content 'Bahamas'
    expect(page).to have_content 'This is a luxury house with a sea view'
    expect(page).to have_content '£300.00'
  end
end
