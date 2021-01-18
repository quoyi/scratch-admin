# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  code            :string
#  name            :string
#  status          :integer          default("enabled")
#  intro           :text
#  desc            :text
#  organization_id :bigint
#
# Indexes
#
#  index_roles_on_organization_id           (organization_id)
#  index_roles_on_organization_id_and_code  (organization_id,code) UNIQUE
#  index_roles_on_organization_id_and_name  (organization_id,name) UNIQUE
#
class Role < ApplicationRecord
  include Codable
  include Statable

  delegate :name, to: :organization, prefix: true, allow_nil: true

  belongs_to :organization, optional: true
  # has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions

  validates :code, presence: true, uniqueness: { scope: :organization_id }
  validates :name, presence: true, uniqueness: { scope: :organization_id }
end
