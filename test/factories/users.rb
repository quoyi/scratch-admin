# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { User.generate_email }
    password { 123_456 }

    reset_password_token { Faker::Lorem.unique.characters(number: 50) }
    reset_password_sent_at { Time.current }

    remember_created_at { Time.current }

    sign_in_count { 1 }
    current_sign_in_at { Time.current }
    last_sign_in_at { Time.current }
    current_sign_in_ip { '127.0.0.1' }
    last_sign_in_ip { '127.0.0.1' }

    mobile { User.generate_mobile }
    nick { Faker::Name.name }
    gender { 0 }
    token { User.generate_token }
    status { 0 }
    guest { false }

    factory :admin do
      role { 'admin' }
      guest { false }
    end
  end
end

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
#  gender                 :integer          default("unknown")
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
