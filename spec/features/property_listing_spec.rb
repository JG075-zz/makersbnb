require_relative 'web_helper'

feature 'View listing' do
  scenario 'user can view list of properties' do
    sign_up
    new_space
    visit '/spaces'
    expect(page).to have_content 'sup3r cool house'
    expect(page).to have_content 'sup3r village'
    expect(page).to have_content 'where sup3r cool people live'
    expect(page).to have_content '£200'
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
    click_button "Register new space"
    fill_in('start_date', with: "01-11-2016")
    fill_in('end_date', with: "03-11-2016")
    click_button 'Add Property'
    expect{click_button 'Add Property'}.not_to change(Property, :count)
    expect(page).to have_content("Name must not be blank")
    expect(page).to have_content("Location must not be blank")
    expect(page).to have_content("Price must not be blank")
    expect(page).to have_content("Price must be an integer")
  end
end
