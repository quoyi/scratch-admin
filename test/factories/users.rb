# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  nick                   :string
#  mobile                 :string
#  gender                 :integer          default("unkown")
#  token                  :string
#  status                 :integer          default("enabled")
#  role                   :integer          default("normal")
#  guest                  :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_guest                 (guest)
#  index_users_on_mobile                (mobile) UNIQUE
#  index_users_on_nick                  (nick)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_token                 (token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }
    password { 123_456 }

    reset_password_token { '1' }
    reset_password_sent_at { Time.current }

    remember_created_at { Time.current }

    sign_in_count { 1 }
    current_sign_in_at { Time.current }
    last_sign_in_at { Time.current }
    current_sign_in_ip { '127.0.0.1' }
    last_sign_in_ip { '127.0.0.1' }
  end
end
