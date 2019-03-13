require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user_1 = User.create(name: 'Example User',
                     email: 'user@example.com',
                     password: 'secret',
                     password_confirmation: 'secret',
                     activated: true)
   @user_2 = User.create(name: 'Another User',
                    email: 'another@example.com',
                    password: 'secret',
                    password_confirmation: 'secret',
                    activated: true)
  @relationship = Relationship.new(follower_id:  @user_1.id,
                                   followed_id: @user_2.id)
  end
  describe 'validations' do
    context 'valid' do
      it 'is valid with follower_id and followed_id' do
        expect(@relationship).to be_valid
      end
    end
    context 'invalid' do
      it 'is not valid without a folower_id' do
        @relationship.follower_id = nil
        expect(@relationship).not_to be_valid
      end
      it 'is not valid without a followed_id' do
        @relationship.followed_id = nil
        expect(@relationship).not_to be_valid
      end
    end
  end
end
