require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'Example User', email: 'user@example.com')
    end
    it "is valid when attributes are valid" do
      expect(@user).to be_valid
    end
    it "is not valid if name and email are blank" do
      @user.name = "   "
      @user.email = "   "
      expect(@user).not_to be_valid
    end
    it "is not valid if name is above 50 chars" do
      @user.name = "a" * 51
      expect(@user).not_to be_valid
    end
    it "is not valid if email is above 255 chars" do
      @user.email = "user" + "@" * 241 + "example.com"
      expect(@user).not_to be_valid
    end
  end
end
