# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    code { Course.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    mold { 1 }
    intro { 'MyText' }
    desc { 'MyText' }
    creator { nil }
    ancestry_depth { 1 }
    children_count { 0 }
    ancestry { nil }
    position { 0 }
  end
end

# == Schema Information
#
# Table name: courses
#
#  code           :string
#  name           :string
#  status         :integer          default("enabled")
#  mold           :integer          default("private")
#  seq            :integer          default(0)
#  intro          :text
#  desc           :text
#  creator_id     :bigint
#  ancestry_depth :integer          default(0)
#  children_count :integer          default(0)
#  ancestry       :string
#  position       :integer          default(0)
#
# Indexes
#
#  by_ancestry_code             (ancestry,code) UNIQUE
#  by_ancestry_name             (ancestry,name) UNIQUE
#  index_courses_on_ancestry    (ancestry)
#  index_courses_on_creator_id  (creator_id)
#
