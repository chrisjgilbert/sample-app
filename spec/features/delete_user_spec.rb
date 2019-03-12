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
    @admin_user = User.create(name: 'admin',
                              email: 'admin@example.com',
                              password: 'password',
                              password_confirmation: 'password',
                              admin: true,
                              activated: true,
                              activated_at: Time.zone.now)
  end
  context 'when user is admin' do
    it 'can delete users' do
      login(@admin_user)
      visit users_path
      expect(User.count).to eq 2
      first(".delete").click
      expect(User.count).to eq 1
      expect(current_path).to eq users_path
    end
  end

  context 'when user is not admin' do
    it 'cannot delete users' do
      login(@user)
      visit users_path
      expect(page).not_to have_link "delete"
    end
  end

end
