feature "Send email" do
  scenario "on user sign up" do
    expect(SendEmail).to receive(:call)
    visit '/users/new'
    fill_in :name, with: "Li"
    fill_in :email, with: "fakepostmaster@gmail.com"
    fill_in :password, with: "Secret"
    fill_in :password_confirmation, with: "Secret"
    click_button "Sign up"
  end
end
