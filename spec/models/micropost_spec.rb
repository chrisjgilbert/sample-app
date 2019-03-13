require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = User.create(name: 'Example User',
                     email: 'user@example.com',
                     password: 'secret',
                     password_confirmation: 'secret',
                     activated: true)
    @micropost = Micropost.new(content: 'lorem ipsum',
                               user_id: @user.id)
  end
  describe 'validations' do
    context 'user_id' do
      it 'is valid with a user_id' do
        expect(@micropost).to be_valid
      end
      it 'is not be valid without a user_id' do
        @micropost.user_id = nil
        expect(@micropost).not_to be_valid
      end
    end
    context 'content' do
      it 'is valid <= 140 chars' do
        @micropost.content = "a" * 140
        expect(@micropost).to be_valid
      end
      it 'is not valid if > 140 chars' do
        @micropost.content = "a" * 141
        expect(@micropost).not_to be_valid
      end
      it 'is not valid if empty' do
        @micropost.content = ""
        expect(@micropost).not_to be_valid
      end
    end
  end
end
