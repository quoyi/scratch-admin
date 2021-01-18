# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    code { Organization.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    desc { 'MyText' }
    intro { 'MyText' }
    contacts { 'MyString' }
    mobile { 'MyString' }
    superior { nil }
  end
end

# == Schema Information
#
# Table name: organizations
#
#  code        :string           not null
#  name        :string           not null
#  status      :integer          default("enabled")
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
