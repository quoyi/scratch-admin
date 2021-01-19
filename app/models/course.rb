# frozen_string_literal: true

class Course < ApplicationRecord
  include Codable
  include Statable
  include Gradable
  include Stackable

  delegate :name, to: :superior, prefix: true, allow_nil: true
  delegate :name, to: :prev, prefix: true, allow_nil: true
  delegate :name, to: :creator, prefix: true, allow_nil: true

  belongs_to :creator, class_name: 'User', inverse_of: :created_courses, optional: true

  validates :code, presence: true, uniqueness: { scope: :superior_id }
  validates :name, presence: true, uniqueness: { scope: :superior_id }

  enum mold: { private: 0, public: 1 }, _suffix: true
end

# == Schema Information
#
# Table name: courses
#
#  code          :string
#  name          :string
#  status        :integer          default("enabled")
#  mold          :integer          default("private")
#  seq           :integer          default(0)
#  juniors_count :integer          default(0)
#  intro         :text
#  desc          :text
#  superior_id   :bigint
#  prev_id       :bigint
#  creator_id    :bigint
#
# Indexes
#
#  index_courses_on_creator_id            (creator_id)
#  index_courses_on_prev_id               (prev_id)
#  index_courses_on_superior_id           (superior_id)
#  index_courses_on_superior_id_and_code  (superior_id,code) UNIQUE
#  index_courses_on_superior_id_and_name  (superior_id,name) UNIQUE
#
