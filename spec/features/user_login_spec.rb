require 'rails_helper'

RSpec.describe "user log in", :type => :feature do
  before do
    @user = User.create(name: 'test',
                        email: 'test@example.com',
                        password: 'secret',
                        password_confirmation: 'secret')
    visit login_path
  end
  context 'unsuccessful' do
    it "flashes error message" do
      fill_in 'session[email]', with: 'blah@blah.com'
      fill_in 'session[password]', with: 'blah'
      click_on 'Log in'
      expect(page).to have_link 'Log In'
      expect(page).to have_link 'Sign Up'
      expect(page).not_to have_content 'Welcome to the Sample App!'
      expect(page).to have_content 'Invalid email/password combination'
    end
  end
  context 'successful' do
    it "logs user in" do
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_on 'Log in'
      expect(page).not_to have_link 'Log In'
      expect(page).not_to have_link 'Sign Up'
      expect(page).to have_content 'Welcome to the Sample App!'
      expect(page).not_to have_content 'Invalid email/password combination'
    end
  end
end
