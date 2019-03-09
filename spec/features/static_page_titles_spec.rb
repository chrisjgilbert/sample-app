# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'homepage links', type: :feature do
  base_title = 'Ruby on Rails Tutorial Sample App'
  before do
    visit root_path
  end
  describe 'home' do
    it 'has `home` as title' do
      click_on 'Home'
      expect(current_path).to eq root_path
      expect(page.title).to eq base_title.to_s
    end
  end

  describe 'about' do
    it 'has `about` as title' do
      click_on 'About'
      expect(current_path).to eq about_path
      expect(page.title).to eq "about | #{base_title}"
    end
  end

  describe 'help' do
    it 'has `help` as title' do
      click_on 'Help'
      expect(current_path).to eq help_path
      expect(page.title).to eq "help | #{base_title}"
    end
  end

  describe 'contact' do
    it 'has `help` as title' do
      click_on 'Contact'
      expect(current_path).to eq contact_path
      expect(page.title).to eq "contact | #{base_title}"
    end
  end

  describe 'sign up' do
    it 'has `sign up` as title' do
      click_on 'Sign up now!'
      expect(current_path).to eq sign_up_path
      expect(page.title).to eq "sign up | #{base_title}"
    end
  end
end
