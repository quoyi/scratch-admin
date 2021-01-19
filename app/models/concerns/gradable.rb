# frozen_string_literal: true

module Gradable
  extend ActiveSupport::Concern

  included do
    delegate :name, to: :superior, prefix: true, allow_nil: true

    # rubocop:disable Rails/ReflectionClassName
    belongs_to :superior, class_name: name, inverse_of: :juniors, optional: true
    has_many :juniors, class_name: name, foreign_key: 'superior_id',
                       dependent: :delete_all, inverse_of: :superior
    # rubocop:enable Rails/ReflectionClassName

    validates :code, presence: true, uniqueness: { scope: :superior_id }
    validates :name, presence: true, uniqueness: { scope: :superior_id }

    scope :roots, -> { where(superior_id: nil) }
    scope :nodes, -> { where.not(superior_id: nil) }
  end
end
