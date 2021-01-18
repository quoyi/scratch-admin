# frozen_string_literal: true

module Codable
  extend ActiveSupport::Concern

  included do
    before_validation :auto_complete

    validates :code, presence: true, uniqueness: true

    def self.generate_code(code = nil)
      return code if code && !exists?(code: code)

      generate_code(strftime(:long_serial))
    end
  end

  protected

    def generate_code
      self.code = self.class.generate_code
    end

  private

    def auto_complete
      generate_code if code.blank?
    end
end
