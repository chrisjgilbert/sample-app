require 'rails_helper'

RSpec.describe "user log out", :type => :feature do
  before do
    @user = User.create(name: 'test',
                        email: 'test@example.com',
                        password: 'secret',
                        password_confirmation: 'secret')
    visit login_path
  end
  context 'successful' do
    it "logs user in" do
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_on 'Log in'
      expect(page).not_to have_link 'Log In'
      expect(page).not_to have_link 'Sign Up'
      expect(page).to have_content 'Welcome to the Sample App!'
      click_on 'Account'
      click_on 'Log out'
      expect(current_path).to eq root_path
      expect(page).to have_link 'Log In'
      expect(page).to have_link 'Sign Up'
      expect(page).to have_content 'You have logged out!'
    end
  end
end
