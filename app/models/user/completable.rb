# frozen_string_literal: true

module User::Completable
  extend ActiveSupport::Concern

  included do
    before_validation :auto_complete

    def self.generate_mobile(mobile = nil)
      return mobile if mobile && !exists?(mobile: mobile)

      generate_mobile("1#{rand(3..9)}#{9.times.map { rand(10) }.join}")
    end

    def self.generate_email(email = nil)
      return email if email && !exists?(email: email)

      generate_email("#{strftime(:long_serial)}@#{Setting.mail_suffix}")
    end

    def self.generate_token(token = nil)
      return token if token && !exists?(token: token)

      generate_token(SecureRandom.urlsafe_base64(Setting.token_length))
    end
  end

  protected

    def generate_mobile
      self.mobile = self.class.generate_mobile
    end

    def generate_email
      self.email = self.class.generate_email
    end

    def generate_token
      self.token = self.class.generate_token
    end

  private

    def auto_complete
      generate_mobile if mobile.blank?
      generate_token if token.blank?
      generate_email if email.blank?

      self.nick ||= email[/\A([^@\s]+)@[^@\s]+\z/i, 1]
    end
end
