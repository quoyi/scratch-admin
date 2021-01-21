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
    ancestry { nil }
    ancestry_depth { 0 }
    children_count { 0 }
  end
end

# == Schema Information
#
# Table name: organizations
#
#  code           :string           not null
#  name           :string           not null
#  status         :integer          default("enabled")
#  desc           :text
#  intro          :text
#  contacts       :string
#  mobile         :string
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#  children_count :integer          default(0)
#
# Indexes
#
#  index_organizations_on_ancestry           (ancestry)
#  index_organizations_on_ancestry_and_code  (ancestry,code) UNIQUE
#  index_organizations_on_ancestry_and_name  (ancestry,name) UNIQUE
#
