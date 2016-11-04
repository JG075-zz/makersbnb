# feature "Send email" do
#   scenario "on user sign up" do
#     expect(SendEmail).to receive(:call).with(@current_user)
#     visit '/users/new'
#     fill_in :name, with: "Li"
#     fill_in :email, with: "postmaster@sandbox4ea7364b34d64c608f3cc57a4b2699f6.mailgun.org"
#     fill_in :password, with: "Secret"
#     fill_in :password_confirmation, with: "Secret"
#     click_button "Sign up"
#   end
# end
