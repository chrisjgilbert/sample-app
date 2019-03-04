require 'rails_helper'

RSpec.describe 'static page titles', :type => :feature do
  second_half_of_title = "| Ruby on Rails Tutorial Sample App"
  describe 'home' do
    it "has `home` as title" do
      visit static_pages_home_path
      expect(page.title).to eq "home #{second_half_of_title}"
    end
  end

  describe 'about' do
    it "has `about` as title" do
      visit static_pages_about_path
      expect(page.title).to eq "about #{second_half_of_title}"
    end
  end

  describe 'help' do
    it "has `help` as title" do
      visit static_pages_help_path
      expect(page.title).to eq "help #{second_half_of_title}"
    end
  end

  describe 'contact' do
    it "has `help` as title" do
      visit static_pages_contact_path
      expect(page.title).to eq "contact #{second_half_of_title}"
    end
  end
end
