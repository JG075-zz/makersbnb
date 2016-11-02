require_relative 'web_helper'

feature "prevents double-booking" do
  scenario "users can't double book a property" do
    sign_up
    Property.create(name: "super cool house", location: "47 cool lane", description: "a very cool house", price: 100, user_id: 1)
    visit '/spaces'
    click_button('Rent')
    visit '/requests'
    click_button("Accept")
    visit '/spaces'
    click_button('Rent')
    expect(page).to have_content "This place has already been booked"
  end
end
