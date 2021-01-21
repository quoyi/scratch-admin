# frozen_string_literal: true

class Course < ApplicationRecord
  include Codable
  include Statable

  has_ancestry counter_cache: true, cache_depth: true
  acts_as_list scope: [:ancestry]

  delegate :name, to: :parent, prefix: true, allow_nil: true
  delegate :name, to: :higher_item, prefix: true, allow_nil: true
  delegate :name, to: :creator, prefix: true, allow_nil: true

  belongs_to :creator, class_name: 'User', inverse_of: :created_courses, optional: true

  # validates :code, presence: true, uniqueness: { scope: :parent_id }
  # validates :name, presence: true, uniqueness: { scope: :parent_id }

  enum mold: { private: 0, public: 1 }, _suffix: true
end

# == Schema Information
#
# Table name: courses
#
#  code           :string
#  name           :string
#  status         :integer          default("enabled")
#  mold           :integer          default("private")
#  seq            :integer          default(0)
#  intro          :text
#  desc           :text
#  creator_id     :bigint
#  ancestry_depth :integer          default(0)
#  children_count :integer          default(0)
#  ancestry       :string
#  position       :integer          default(0)
#
# Indexes
#
#  by_ancestry_code             (ancestry,code) UNIQUE
#  by_ancestry_name             (ancestry,name) UNIQUE
#  index_courses_on_ancestry    (ancestry)
#  index_courses_on_creator_id  (creator_id)
#
