# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  setup do
    @parent = create(:course)
    @courses = build_list(:course, 4, parent: @parent)
    @first = @courses.first
    @second = @courses.second
    @third = @courses.third
    @fourth = @courses.fourth
  end

  test 'create first of list' do
    assert_difference('Course.count', +1) do
      @first.save
    end
    assert_equal 1, @first.position
    assert_equal 1, @parent.reload.children_count
    assert_equal @parent.id, @first.parent_id
  end

  test 'create last of list' do
    @first.save
    assert_difference('Course.count', +1) do
      @second.save
    end
    assert_equal 2, @second.position
    assert_equal 2, @parent.reload.children_count
    assert_equal @first.parent_id, @second.parent_id
  end

  test 'create middle of list' do
    @first.save
    @second.save
    @third.position = 2

    assert_difference('Course.count', +1) do
      @third.save
    end
    assert_equal 2, @third.position
    assert_equal 3, @second.reload.position
    assert_equal 3, @parent.reload.children_count
    assert_equal @second.parent_id, @third.parent_id
  end

  test 'create first of another list' do
    @first.save
    @second.save
    @third.save

    @fourth.parent_id = nil
    assert_difference('Course.count', +1) do
      @fourth.save
    end
    assert_nil @fourth.parent_id
    assert_equal 2, @fourth.position
  end
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
