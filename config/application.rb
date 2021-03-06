# frozen_string_literal: true

require_relative 'boot'

ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScratchAdmin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.cache_store = :redis_cache_store, { url: ENV['redis_url'] || 'redis://localhost:6379/1' }

    config.generators do |g|
      g.helper false
      g.stylesheets false
    end

    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]
    config.i18n.available_locales = %w[zh-CN en zh-TW]
    config.i18n.default_locale = 'zh-CN'

    config.time_zone = 'Beijing'
  end
end
