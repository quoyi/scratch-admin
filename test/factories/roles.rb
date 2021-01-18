# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  code            :string
#  name            :string
#  status          :integer          default(0)
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
FactoryBot.define do
  factory :role do
    code { 'MyString' }
    name { 'MyString' }
    status { 1 }
    intro { 'MyText' }
    desc { 'MyText' }
    organization { nil }
  end
end
