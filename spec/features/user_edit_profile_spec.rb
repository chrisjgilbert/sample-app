# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user log in', type: :feature do
  before do
    @user = User.create(name: 'test',
                        email: 'test@example.com',
                        password: 'secret',
                        password_confirmation: 'secret')
    visit login_path
    login(@user)
    click_on 'Account'
    click_on 'Settings'
  end
  context 'unsuccessful' do
    it 'flashes error message' do
      click_on 'Save changes'
      expect(page).not_to have_content 'Profile updated!'
      expect(page).to have_content 'The form contains 2 errors'
    end
  end
  context 'successful' do
    it 'logs user in' do
      fill_in 'user[name]', with: 'edited name'
      fill_in 'user[email]', with: 'edited@email.com'
      fill_in 'user[password]', with: 'secret'
      fill_in 'user[password_confirmation]', with: 'secret'
      click_on 'Save changes'
      expect(page).to have_content 'Profile updated!'
      expect(page).not_to have_content '3 errors'
    end
  end
end