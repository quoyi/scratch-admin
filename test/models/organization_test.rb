# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  code        :string           not null
#  name        :string           not null
#  status      :integer          default(0)
#  desc        :text
#  intro       :text
#  contacts    :string
#  mobile      :string
#  superior_id :bigint
#
# Indexes
#
#  index_organizations_on_code_and_superior_id  (code,superior_id) UNIQUE
#  index_organizations_on_name_and_superior_id  (name,superior_id) UNIQUE
#  index_organizations_on_superior_id           (superior_id)
#
require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
