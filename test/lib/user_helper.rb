# frozen_string_literal: true

class UserHelper
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
end
