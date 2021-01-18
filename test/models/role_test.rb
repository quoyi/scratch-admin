# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  code            :string
#  name            :string
#  status          :integer          default("enabled")
#  intro           :text
#  desc            :text
#  organization_id :bigint
#
# Indexes
#
#  index_roles_on_organization_id           (organization_id)
#  index_roles_on_organization_id_and_code  (organization_id,code) UNIQUE
#  index_roles_on_organization_id_and_name  (organization_id,name) UNIQUE
#
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
