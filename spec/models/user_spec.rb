require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'Example User', email: 'user@example.com')
    end
    it "should be valid" do
      expect(@user).to be_valid
    end
    it "should not be valid if name and email are blank" do
      @user.name = "   "
      @user.email = "   "
      expect(@user).not_to be_valid
    end
  end
end
