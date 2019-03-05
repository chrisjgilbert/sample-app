require 'rails_helper'

RSpec.describe 'static page titles', :type => :feature do
  base_title = "Ruby on Rails Tutorial Sample App"
  describe 'home' do
    it "has `home` as title" do
      visit root_path
      expect(page.title).to eq "#{base_title}"
    end
  end

  describe 'about' do
    it "has `about` as title" do
      visit about_path
      expect(page.title).to eq "about | #{base_title}"
    end
  end

  describe 'help' do
    it "has `help` as title" do
      visit help_path
      expect(page.title).to eq "help | #{base_title}"
    end
  end

  describe 'contact' do
    it "has `help` as title" do
      visit contact_path
      expect(page.title).to eq "contact | #{base_title}"
    end
  end
end
