# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: categories
#
#  code              :string
#  name              :string
#  status            :integer          default("enabled")
#  desc              :text
#  superior_id       :bigint
#  classifiable_type :string
#  classifiable_id   :bigint
#
# Indexes
#
#  index_categories_on_classifiable          (classifiable_type,classifiable_id)
#  index_categories_on_superior_id           (superior_id)
#  index_categories_on_superior_id_and_code  (superior_id,code) UNIQUE
#  index_categories_on_superior_id_and_name  (superior_id,name) UNIQUE
#
