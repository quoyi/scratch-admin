# frozen_string_literal: true

module Traceable
  extend ActiveSupport::Concern

  included do
    delegate :name, to: :parent, prefix: true, allow_nil: true

    has_ancestry counter_cache: true, cache_depth: true

    validates :code, presence: true, uniqueness: { scope: :ancestry }
    validates :name, presence: true, uniqueness: { scope: :ancestry }
  end
end
