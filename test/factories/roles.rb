# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    code { Role.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    intro { Faker::Lorem.characters(number: 10) }
    desc { Faker::Lorem.characters(number: 10) }
    organization { nil }
  end
end

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
