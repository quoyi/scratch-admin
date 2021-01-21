# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    code { Category.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    desc { 'MyString' }
    classifiable { nil }
    ancestry_depth { 1 }
    children_count { 0 }
    ancestry { nil }
  end
end

# == Schema Information
#
# Table name: categories
#
#  code              :string
#  name              :string
#  status            :integer          default("enabled")
#  desc              :text
#  classifiable_type :string
#  classifiable_id   :bigint
#  ancestry          :string
#  ancestry_depth    :integer          default(0)
#  children_count    :integer          default(0)
#
# Indexes
#
#  index_categories_on_ancestry           (ancestry)
#  index_categories_on_ancestry_and_code  (ancestry,code) UNIQUE
#  index_categories_on_ancestry_and_name  (ancestry,name) UNIQUE
#  index_categories_on_classifiable       (classifiable_type,classifiable_id)
#
