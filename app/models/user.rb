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
class User < ApplicationRecord
  include Devisable
  include Statable

  before_validation :auto_complete

  enum gender: { unkown: 0, female: 1, male: 2 }, _prefix: true
  enum role: { normal: 0, vip: 1, developer: 2, manager: 3, admin: 4 }

  protected

    def generate_mobile
      self.mobile = "1#{rand(3..9)}#{rand(999_999_999)}"
      generate_mobile if self.class.exists?(mobile: mobile)
    end

    def generate_email
      self.email = "#{self.class.strftime(:long_serial)}@#{Setting.mail_suffix}"
      generate_email if self.class.exists?(email: email)
    end

    def generate_token
      self.token = SecureRandom.urlsafe_base64(Setting.token_length)
      generate_token if self.class.exists?(token: token)
    end

  private

    def auto_complete
      generate_mobile if mobile.blank?
      generate_token if token.blank?
      generate_email if email.blank?

      self.nick ||= email[/\A([^@\s]+)@[^@\s]+\z/i, 1]
    end
end
