require 'rails_helper'

RSpec.describe "user sign up", :type => :feature do
  it "wont allow a user with invalid attributes to sign up" do
    visit new_user_path
    fill_in 'user[name]', with: '   '
    fill_in 'user[email]', with: 'jon@b'
    fill_in 'user[password]', with: 'a'
    fill_in 'user[password_confirmation]', with: 'a'
    click_on 'Create my account'
    expect(page).to have_content('3 errors')
  end
end
