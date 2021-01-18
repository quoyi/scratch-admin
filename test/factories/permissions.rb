# frozen_string_literal: true

FactoryBot.define do
  factory :permission do
    code { 'MyString' }
    name { 'MyString' }
    status { 1 }
    intro { 'MyText' }
    desc { 'MyText' }
    namespace { 'MyString' }
    controller { 'MyString' }
    action { 'MyString' }
  end
end

# == Schema Information
#
# Table name: permissions
#
#  code       :string
#  name       :string
#  status     :integer          default("enabled")
#  intro      :text
#  desc       :text
#  namespace  :string
#  controller :string
#  action     :string
#
# Indexes
#
#  index_permissions_on_code  (code) UNIQUE
#  index_permissions_on_name  (name) UNIQUE
#
