require 'spec_helper'
require_relative 'web_helper'

feature 'View listing' do
  scenario 'user can view list of properties' do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    expect(page).to have_content 'super cool house'
    expect(page).to have_content '47 cool lane'
    expect(page).to have_content 'a very cool house'
    expect(page).to have_content '£100'
  end
end

feature 'Create listing' do
  scenario 'user can add a new listing' do
    sign_up
    new_space
    expect(page).to have_content 'sup3r cool house'
    expect(page).to have_content 'sup3r village'
    expect(page).to have_content 'where sup3r cool people live'
    expect(page).to have_content '£200'
  end
  scenario 'user leaves form blank' do
    sign_up
    visit '/spaces/new'
    click_button 'Add Property'
    expect{click_button 'Add Property'}.not_to change(Property, :count)
    expect(page).to have_content("Name must not be blank")
    expect(page).to have_content("Location must not be blank")
    expect(page).to have_content("Price must not be blank")
    expect(page).to have_content("Price must be an integer")
  end
end
