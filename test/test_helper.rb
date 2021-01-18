# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'

Dir[Rails.root.join('test/support/*_helpers.rb')].sort.each { |file| require file }

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  include Warden::Test::Helpers

  ### custom helpers ###
  def log_in_user
    # Warden::Test::Helpers.login_as(user, opts = {})
    # binding.pry -> login_as -> path_to_ruby/gems/warden-1.2.9/lib/warden/test/helpers.rb:18
    login_as FactoryBot.create(:user)
  end

  def log_in_admin
    # Warden::Test::Helpers.login_as(user, opts = {})
    # binding.pry -> login_as -> path_to_ruby/gems/warden-1.2.9/lib/warden/test/helpers.rb:18
    login_as FactoryBot.create(:admin)
  end

  def log_out
    # Warden::Test::Helpers.logout(*scopes)
    # binding.pry -> login_as -> path_to_ruby/gems/warden-1.2.9/lib/warden/test/helpers.rb:31
    logout
  end

  include AuthHelpers
end

class ActionDispatch::IntegrationTest
  # Make the Devise helper methods in all integration tests
  include Devise::Test::IntegrationHelpers

  ### custom helpers ###
  def log_in_user
    # Devise::Test::IntegrationHelpers.sign_in(resource, scope: nil)
    # binding.pry -> sign_in -> path_to_ruby/gems/devise-4.7.3/lib/devise/test/integration_helpers.rb:37
    sign_in FactoryBot.create(:user), scope: :user
  end

  def log_in_admin
    # Devise::Test::IntegrationHelpers.sign_in(resource, scope: nil)
    # binding.pry -> sign_in -> path_to_ruby/gems/devise-4.7.3/lib/devise/test/integration_helpers.rb:37
    sign_in FactoryBot.create(:admin), scope: :user
  end

  def log_out
    # Devise::Test::IntegrationHelpers.sign_out(resource_or_scope)
    # binding.pry -> sign_in -> path_to_ruby/gems/devise-4.7.3/lib/devise/test/integration_helpers.rb:37
    sign_out :user
  end
end
