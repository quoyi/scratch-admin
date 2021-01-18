# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  code        :string           not null
#  name        :string           not null
#  status      :integer          default(0)
#  desc        :text
#  intro       :text
#  contacts    :string
#  mobile      :string
#  superior_id :bigint
#
# Indexes
#
#  index_organizations_on_code_and_superior_id  (code,superior_id) UNIQUE
#  index_organizations_on_name_and_superior_id  (name,superior_id) UNIQUE
#  index_organizations_on_superior_id           (superior_id)
#
class Organization < ApplicationRecord
  include Codable
  include Statable

  delegate :name, to: :superior, prefix: true, allow_nil: true

  belongs_to :superior, class_name: 'Organization', inverse_of: :juniors,
                        optional: true
  has_many :juniors, class_name: 'Organization', foreign_key: 'superior_id',
                     dependent: :delete_all, inverse_of: :superior

  validates :code, presence: true, uniqueness: { scope: :superior_id }
  validates :name, presence: true, uniqueness: { scope: :superior_id }
end
