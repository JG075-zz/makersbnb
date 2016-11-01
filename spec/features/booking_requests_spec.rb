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
  scenario "users can view their own requested bookings" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    click_button("Log out")
    sign_up2
    visit '/requests'
    expect(page).to have_content "All requests:"
    expect(page).not_to have_content "super cool house"
  end
end
