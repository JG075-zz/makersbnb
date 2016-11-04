require_relative 'web_helper'

feature "booking requests as a customer" do
  before :each do
    sign_up
    new_space
    visit '/spaces'
    filter
    click_button('Rent')
  end

  scenario "users can make a booking" do
    expect(page).to have_content "Your request has been sent to Li"
  end

  scenario "users can view their own requested bookings" do
    click_button("Log out")
    sign_up2
    visit '/requests'
    expect(page).to have_content "See the requests you have made and received"
    expect(page).not_to have_content "super cool house"
  end

  scenario "can accept bookings" do
    visit '/requests'
    click_button("Accept")
    expect(page).not_to have_content "super cool house"
  end

  scenario "can decline bookings" do
    visit '/requests'
    click_button("Decline")
    expect(page).not_to have_content "super cool house"
  end
end

feature "booking requests as a renter" do
  before :each do
    sign_up
    new_space
    visit '/spaces'
    click_button("Log out")
  end

  scenario "can view requests I have received" do
    sign_up2
    visit '/spaces'
    filter
    click_button('Rent')
    click_button("Log out")
    fill_in :email, with: "Li@gmail.com"
    fill_in :password, with: "Secret"
    click_button "Log in"
    visit '/requests'
    expect(page).to have_content 'Requests I\'ve Received'
    expect(page).to have_content 'You have received booking request for sup3r cool house'
  end
end
