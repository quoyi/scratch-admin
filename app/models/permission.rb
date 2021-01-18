# frozen_string_literal: true

class Permission < ApplicationRecord
  include Codable
  include Statable

  has_and_belongs_to_many :roles
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
