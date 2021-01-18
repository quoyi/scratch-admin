# frozen_string_literal: true

class User < ApplicationRecord
  include User::Devisable
  include Statable
  include User::Completable

  # has_and_belongs_to_many :roles

  # before_validation :auto_complete

  enum gender: { unknown: 0, female: 1, male: 2 }, _prefix: true
  enum role: { normal: 0, vip: 1, developer: 2, manager: 3, admin: 4 }

  def username
    nick || mobile || email
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
