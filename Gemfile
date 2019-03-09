# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bcrypt', '3.1.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'sqlite3', '1.3.11'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
  gem 'rails-controller-testing', '0.1.1'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg', '0.18.4'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
