# frozen_string_literal: true

class Organization < ApplicationRecord
  include Codable
  include Statable
  include Gradable
end

# == Schema Information
#
# Table name: organizations
#
#  code        :string           not null
#  name        :string           not null
#  status      :integer          default("enabled")
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
