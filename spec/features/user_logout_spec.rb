# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user log out', type: :feature do
  before do
    @user = User.create(name: 'test',
                        email: 'test@example.com',
                        password: 'secret',
                        password_confirmation: 'secret',
                        activated: true,
                        activated_at: Time.zone.now)
    visit login_path
  end
  context 'successful' do
    it 'logs user out' do
      login @user
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
