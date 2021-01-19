# frozen_string_literal: true

class Material < ApplicationRecord
  include Codable
  include Statable

  belongs_to :category, optional: true
  belongs_to :uploader, class_name: 'User', optional: true

  has_one_attached :accessory

  validates :code, presence: true, uniqueness: true
  # validates :accessory, attached: true, content_type: { in: %i[png jpg jpeg], message: '必须是图片' }

  enum mold: { private: 0, public: 1 }, _suffix: true
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
