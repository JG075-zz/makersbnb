require_relative 'web_helper'
require 'spec_helper'

feature "booking requests" do
  scenario "users can make a booking" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    expect(page).to have_content "Thank you for your request"
  end
  scenario "users can view all requested bookings" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    visit '/requests'
    expect(page).to have_content "All requests:"
    expect(page).to have_content "super cool house"
  end
  scenario "can accept bookings" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    visit '/requests'
    click_button("Accept")
    expect(page).not_to have_content "super cool house"
  end

  scenario "can decline bookings" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    visit '/requests'
    click_button("Decline")
    expect(page).not_to have_content "super cool house"
  end
end
