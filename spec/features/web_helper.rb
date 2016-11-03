def sign_up
  visit '/users/new'
  fill_in :name, with: "Li"
  fill_in :email, with: "Li@gmail.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "Secret"
  click_button "Sign up"
end

def sign_up2
  visit '/users/new'
  fill_in :name, with: "James"
  fill_in :email, with: "James@gmail.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "Secret"
  click_button "Sign up"
end

def wrong_sign_up
  visit '/users/new'
  fill_in :name, with: "Li"
  fill_in :email, with: "Lil@gmail.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "s3cret"
  click_button "Sign up"
end

def blank_sign_up
  visit '/users/new'
  fill_in :name, with: ""
  fill_in :email, with: ""
  fill_in :password, with: ""
  fill_in :password_confirmation, with: ""
  click_button ""
end

def wrong_email_sign_up
  visit '/users/new'
  fill_in :name, with: "Li"
  fill_in :email, with: "Lil.com"
  fill_in :password, with: "Secret"
  fill_in :password_confirmation, with: "secret"
  click_button "Sign up"
end

def new_space
  visit '/spaces/new'
  fill_in('name', with: 'sup3r cool house')
  fill_in('location', with: 'sup3r village')
  fill_in('description', with: 'where sup3r cool people live')
  fill_in('price', with: '200')
  fill_in('start_date', with: "01-11-2016")
  fill_in('end_date', with: "03-11-2016")
  click_button 'Add Property'
end

def add_property
  sign_up
  visit '/spaces/new'
  fill_in('name', with: 'sup3r cool house')
  fill_in('location', with: 'sup3r village')
  fill_in('description', with: 'where sup3r cool people live')
  fill_in('price', with: '200')
  fill_in('start_date', with: "01-11-2016")
  fill_in('end_date', with: "03-11-2016")
  click_button 'Add Property'
end

def add_property2
  visit '/spaces/new'
  fill_in('name', with: 'treehouse')
  fill_in('location', with: 'tree')
  fill_in('description', with: 'many trees')
  fill_in('price', with: '100')
  fill_in('start_date', with: "10-11-2016")
  fill_in('end_date', with: "15-11-2016")
  click_button 'Add Property'
end

def filter
  visit '/spaces'
  fill_in('start', with: '01-11-2016')
  fill_in('end', with: '03-11-2016')
  click_button 'Filter'
end

def filter_some
  visit '/spaces'
  fill_in('start', with: '01-11-2016')
  fill_in('end', with: '02-11-2016')
  click_button 'Filter'
end
