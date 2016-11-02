require_relative 'web_helper'

feature "prevents double-booking" do
  scenario "users can't double book a property" do
    sign_up
    new_space
    visit '/spaces'
    click_button('Rent')
    visit '/requests'
    click_button("Accept")
    visit '/spaces'
    click_button('Rent')
    expect(page).to have_content "This place has already been booked"
  end
end
