# frozen_string_literal: true

class Category < ApplicationRecord
  include Codable
  include Statable
  include Traceable

  belongs_to :classifiable, polymorphic: true, optional: true
end

# == Schema Information
#
# Table name: categories
#
#  code              :string
#  name              :string
#  status            :integer          default("enabled")
#  desc              :text
#  classifiable_type :string
#  classifiable_id   :bigint
#  ancestry          :string
#  ancestry_depth    :integer          default(0)
#  children_count    :integer          default(0)
#
# Indexes
#
#  index_categories_on_ancestry           (ancestry)
#  index_categories_on_ancestry_and_code  (ancestry,code) UNIQUE
#  index_categories_on_ancestry_and_name  (ancestry,name) UNIQUE
#  index_categories_on_classifiable       (classifiable_type,classifiable_id)
#
