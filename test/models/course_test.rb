# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  setup do
    @superior = create(:course)
    @courses = build_list(:course, 4, superior: @superior)
    @first = @courses.first
    @second = @courses.second
    @third = @courses.third
    @fourth = @courses.fourth
  end

  test 'create head of stack' do
    assert_difference('Course.count', +1) do
      @first.save
    end
    assert_equal 1, @first.seq
    assert_equal @superior.id, @first.superior_id
  end

  test 'create end of stack' do
    @first.save
    assert_difference('Course.count', +1) do
      @second.save
    end
    assert_equal 2, @second.seq
    assert_equal @first.superior_id, @second.superior_id
  end

  test 'create middle of stack' do
    @first.save
    @second.save
    @third.seq = 1

    assert_difference('Course.count', +1) do
      @third.save
    end
    assert_equal 2, @second.seq
    assert_equal 3, @third.seq
    assert_equal @second.id, @third.prev_id
    assert_equal 3, @superior.juniors.count
  end

  test 'create head of another stack' do
    @first.save
    @second.save

    @third.superior_id = nil
    assert_difference('Course.count', +1) do
      @third.save
    end
    assert_nil @third.prev_id
    assert_nil @third.superior_id
    assert_nil @superior.superior_id
    # @superior.seq = 1, @third.seq = 2
    assert_equal 2, @third.seq
    # @superior.count + @courses.count = 4
    assert_equal 4, Course.count
  end

  # test 'append to the end of stack' do
  #   @first.save
  #   assert_difference('Course.count', +1) do
  #     @second.save
  #   end
  #   assert_equal @first.seq, 1
  #   assert_equal @second.seq, 2
  #   assert_equal @second.prev_id, @first.id
  #   assert_equal @second.superior_id, @first.superior_id
  #   assert_equal @superior.juniors.count, 2
  # end

  # test 'append to the middle of stack' do
  #   @first.save
  #   @second.save
  #   binding.pry
  #   assert_difference('Course.count', +1) do
  #     @third.prev_id = @first.id
  #     @third.save
  #   end
  #   assert_equal @third.prev_id, @first.id
  #   assert_equal @third.superior_id, @first.superior_id
  #   assert_equal @second.prev_id, @third.id
  # end
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
