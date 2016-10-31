def sign_up
  visit '/'
  fill_in :name, with: "Li"
  fill_in :email, with: "Li@gmail.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "Secret"
  click_button "Sign up"
end

def wrong_sign_up
  visit '/'
  fill_in :name, with: "Li"
  fill_in :email, with: "Lil@gmail.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "s3cret"
  click_button "Sign up"
end

def blank_sign_up
  visit '/'
  fill_in :name, with: ""
  fill_in :email, with: ""
  fill_in :password, with: ""
  fill_in :password_confirmation, with: ""
  click_button ""
end

def wrong_email_sign_up
  visit '/'
  fill_in :name, with: "Li"
  fill_in :email, with: "Lil.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "secret"
  click_button "Sign up"
end
