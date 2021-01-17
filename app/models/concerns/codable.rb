# frozen_string_literal: true

module Codable
  extend ActiveSupport::Concern

  included do
    attribute :code, :string, default: -> { strftime(:long_serial) }

    validates :code, presence: true, uniqueness: true
  end
end
