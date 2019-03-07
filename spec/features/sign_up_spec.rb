require 'rails_helper'

RSpec.describe "user sign up", :type => :feature do
  before do
    visit new_user_path
  end
  it "wont allow a user with invalid attributes to sign up" do
    fill_in 'user[name]', with: '   '
    fill_in 'user[email]', with: 'jon@b'
    fill_in 'user[password]', with: 'a'
    fill_in 'user[password_confirmation]', with: 'a'
    click_on 'Create my account'
    expect(page).to have_content('3 errors')
    expect(current_path).to eq sign_up_path
  end

  it "will allow a user with valid attributes to sign up" do
    user = User.new(name: 'Test User',
                    email: 'test@user.com',
                    password: 'secret',
                    password_confirmation: 'secret')
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_on 'Create my account'
    expect(page).not_to have_content('errors')
    expect(current_path).to eq "/users/1"
  end
end