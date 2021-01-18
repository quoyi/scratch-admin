# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @category = create(:category)
  end

  test 'should get index' do
    get admin_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_category_url
    assert_response :success
  end

  test 'should create category' do
    @new_category = build(:category)
    assert_difference('Category.count') do
      post admin_categories_url, params: { category: @new_category.as_json }
    end

    assert_redirected_to admin_categories_url
  end

  test 'should show category' do
    get admin_category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch admin_category_url(@category), params: { category: @category.as_json }
    assert_redirected_to admin_categories_url
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete admin_category_url(@category)
    end

    assert_redirected_to admin_categories_url
  end
end
