# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'edit user profile', type: :feature do

  before do
    @user = User.create(name: 'test',
                        email: 'test@example.com',
                        password: 'secret',
                        password_confirmation: 'secret',
                        activated: true,
                        activated_at: Time.zone.now)
  end

  context 'when user is logged in' do
    before do
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
      it 'redirects to the root path on attempt to edit non current user' do
        @user_2 = User.create(name: 'test2',
                            email: 'test2@example.com',
                            password: 'secret',
                            password_confirmation: 'secret',
                            activated: true,
                            activated_at: Time.zone.now)
        visit edit_user_path(@user_2)
        expect(current_path).to eq root_path
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

  context 'when user is not logged in' do
    it 'is redirected to the login path' do
      visit edit_user_path(@user)
      expect(current_path).to eq login_path
      expect(page).to have_content 'Please log in'
    end
  end

  context 'when logged out user attempts to edit and then logs in' do
    it 'redirects to login and then to intended page' do
      visit edit_user_path(@user)
      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: @user.password
      click_on 'Log in'
      expect(current_path).to eq edit_user_path(@user)
    end
  end
end
