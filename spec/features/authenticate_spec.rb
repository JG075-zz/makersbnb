require_relative 'web_helper'
require 'spec_helper'

feature "users can log in and out" do
  scenario "user can log in" do
    sign_up
    click_button "Log out"
    fill_in :email, with: "Li@gmail.com"
    fill_in :password, with: "Secret"
    click_button "Log in"
    expect(page).to have_content("Li")
  end

  scenario "user can log out" do
    sign_up
    click_button "Log out"
    expect(page).to have_content("You have successfully logged out")
  end
end
