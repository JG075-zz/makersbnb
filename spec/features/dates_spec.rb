require_relative 'web_helper'

feature "creating a property with available dates" do

  scenario "users can make a booking" do
    sign_up
    visit '/spaces/new'
    fill_in('name', with: 'sup3r cool house')
    fill_in('location', with: 'sup3r village')
    fill_in('description', with: 'where sup3r cool people live')
    fill_in('price', with: '200')
    fill_in('start_date', with: "01-11-2016")
    fill_in('end_date', with: "03-11-2016")
    click_button 'Add Property'
    expect(page).to have_content "Available from 01 November 2016 until 03 November 2016"
  end

  scenario "users must enter a valid date" do
    sign_up
    visit '/spaces/new'
    fill_in('name', with: 'sup3r cool house')
    fill_in('location', with: 'sup3r village')
    fill_in('description', with: 'where sup3r cool people live')
    fill_in('price', with: '200')
    fill_in('start_date', with: "11-11-2016")
    fill_in('end_date', with: "03-11-2016")
    click_button 'Add Property'
    expect(page).to have_content "Please enter valid dates."
  end
end
