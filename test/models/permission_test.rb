# frozen_string_literal: true

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
require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
