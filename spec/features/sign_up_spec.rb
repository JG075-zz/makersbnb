require_relative 'web_helper.rb'

feature "users can sign up" do
  scenario "new user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Li")
  end
end
