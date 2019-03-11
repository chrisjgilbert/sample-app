require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { double(:user) }
    let(:mail) { UserMailer.account_activation(user) }

    before(:each) do
      allow(user).to receive(:email) { 'test@user.com' }
      allow(user).to receive(:name) { 'test' }
      allow(user).to receive(:activation_token) { '123' }
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(['test@user.com'])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the user name" do
      expect(mail.body.encoded).to match('Hi test')
    end

    it 'renders the link' do
      expect(mail.body.encoded).to include("http://localhost:3000/account_activation/123/edit?email=test%40user.com")
    end
  end

  # describe "password_reset" do
  #   let(:mail) { UserMailer.password_reset }
  #
  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Password reset")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end
  #
  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end
