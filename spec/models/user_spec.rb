# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     email: 'user@example.com',
                     password: 'secret',
                     password_confirmation: 'secret',
                     activated: true)
  end
  describe 'validations' do
    context 'name' do
      it 'is valid when attributes are valid' do
        expect(@user).to be_valid
      end
      it 'is not valid if name and email are blank' do
        @user.name = '   '
        @user.email = '   '
        expect(@user).not_to be_valid
      end
      it 'is not valid if name is above 50 chars' do
        @user.name = 'a' * 51
        expect(@user).not_to be_valid
      end
    end
    context 'email' do
      it 'is not valid if email is above 255 chars' do
        @user.email = 'user' + '@' * 241 + 'example.com'
        expect(@user).not_to be_valid
      end
      it 'accepts valid addresses' do
        valid_addresses = %w[user@example.com chris@EMAIL.com TEST@email.co.uk]
        valid_addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
      it 'rejects invalid email addresses' do
        invalid_addresses = %w[user@example,com user_at_foo.org user@example.]
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
      it 'case sensitive rejection if email is already taken' do
        user = @user.dup
        user.email = user.email.upcase
        @user.save
        expect(user).not_to be_valid
      end
      it 'converts addresses to downcase' do
        mixed_case_eamil = 'UsEr@EmAiL.CoM'
        @user.email = mixed_case_eamil
        @user.save
        @user.reload
        expect(@user.email).to eq 'user@email.com'
      end
    end
    context 'password' do
      it 'must be present' do
        @user.password = @user.password_confirmation = '  '
        expect(@user).not_to be_valid
      end
      it 'should have a minimum length of 6' do
        @user.password = @user.password_confirmation = 'a' * 5
        expect(@user).not_to be_valid
      end
    end
  end
  describe 'authenticated?' do
    it 'should return false for a user with nil activaton digest' do
      expect(@user).not_to be_authenticated(:activation, '')
    end

    it 'should return false for a user with nil password digest' do
      expect(@user).not_to be_authenticated(:password, '')
    end
  end
end
