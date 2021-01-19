# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    code { Course.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    mold { 1 }
    juniors_count { 1 }
    intro { 'MyText' }
    desc { 'MyText' }
    superior { nil }
    prev { nil }
    creator { nil }
  end
end

# == Schema Information
#
# Table name: courses
#
#  code          :string
#  name          :string
#  status        :integer          default("enabled")
#  mold          :integer          default("private")
#  seq           :integer          default(0)
#  juniors_count :integer          default(0)
#  intro         :text
#  desc          :text
#  superior_id   :bigint
#  prev_id       :bigint
#  creator_id    :bigint
#
# Indexes
#
#  index_courses_on_creator_id            (creator_id)
#  index_courses_on_prev_id               (prev_id)
#  index_courses_on_superior_id           (superior_id)
#  index_courses_on_superior_id_and_code  (superior_id,code) UNIQUE
#  index_courses_on_superior_id_and_name  (superior_id,name) UNIQUE
#
