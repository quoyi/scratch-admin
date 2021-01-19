# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @course = create(:course)
  end

  test 'should get index' do
    get admin_courses_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_course_url
    assert_response :success
  end

  test 'should create course' do
    @new_course = build(:course)
    assert_difference('Course.count') do
      post admin_courses_url, params: { course: @new_course.as_json }
    end

    assert_redirected_to admin_courses_url
  end

  test 'should show course' do
    get admin_course_url(@course)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_course_url(@course)
    assert_response :success
  end

  test 'should update course' do
    patch admin_course_url(@course), params: { course: @course.as_json }
    assert_redirected_to admin_courses_url
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete admin_course_url(@course)
    end

    assert_redirected_to admin_courses_url
  end
end
