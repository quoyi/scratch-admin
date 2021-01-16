# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'redis', '~> 4.0'
gem 'hiredis'
# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2'
gem 'rails-i18n'
gem 'devise'
gem 'devise-i18n'
gem 'simple_form'
gem 'ransack'
gem 'figaro'
gem 'kaminari'
gem 'sidekiq'
gem 'rack-cors', require: 'rack/cors'
gem 'ancestry'
gem 'paper_trail', github: 'paper-trail-gem/paper_trail'
gem 'faker', github: 'faker-ruby/faker', branch: :master
gem 'enumize'
gem 'activestorage-aliyun'
gem 'pghero', github: 'ankane/pghero'
# gem 'exception-track'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'action-cable-testing'
  gem 'amazing_print'
  gem 'annotate'
  gem 'bullet', '~> 6.1.2' # github: 'flyerhzm/bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'squasher', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
