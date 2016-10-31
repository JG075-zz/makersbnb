require_relative 'web_helper.rb'

feature "users can sign up" do
  scenario "new user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Li")
  end
  scenario "cannot sign up with same email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
  scenario "passwords need to match" do
    wrong_sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Password digest does not match the confirmation"
  end
end
