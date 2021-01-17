# frozen_string_literal: true

# == Schema Information
#
# Table name: settings
#
#  var    :string           not null
#  value  :text
#  desc   :text
#  preset :boolean          default(FALSE)
#
# Indexes
#
#  index_settings_on_var  (var) UNIQUE
#
class Setting < RailsSettings::Base
  cache_prefix { 'v1' }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: false, type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: ENV["OMNIAUTH_GOOGLE_CLIENT_ID"], type: :string, readonly: true
  # field :omniauth_google_client_secret, default: ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"], type: :string, readonly: true
end
