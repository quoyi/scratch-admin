# frozen_string_literal: true

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: organizations
#
#  code           :string           not null
#  name           :string           not null
#  status         :integer          default("enabled")
#  desc           :text
#  intro          :text
#  contacts       :string
#  mobile         :string
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#  children_count :integer          default(0)
#
# Indexes
#
#  index_organizations_on_ancestry           (ancestry)
#  index_organizations_on_ancestry_and_code  (ancestry,code) UNIQUE
#  index_organizations_on_ancestry_and_name  (ancestry,name) UNIQUE
#
