# frozen_string_literal: true

FactoryBot.define do
  factory :material do
    code { Material.generate_code }
    name { Faker::Name.unique.name }
    status { 1 }
    mold { 1 }
    used { '' }
    info { '' }
    category { nil }
    uploader { nil }
  end
end

# == Schema Information
#
# Table name: materials
#
#  code        :string
#  name        :string
#  status      :integer          default("enabled")
#  mold        :integer          default("private")
#  used        :bigint           default(0)
#  info        :json
#  category_id :bigint
#  uploader_id :bigint
#
# Indexes
#
#  index_materials_on_category_id  (category_id)
#  index_materials_on_code         (code) UNIQUE
#  index_materials_on_name         (name) UNIQUE
#  index_materials_on_uploader_id  (uploader_id)
#
