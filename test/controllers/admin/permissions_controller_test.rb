# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::PermissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @permission = create(:permission)
  end

  test 'should get index' do
    get admin_permissions_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_permission_url
    assert_response :success
  end

  test 'should create permission' do
    @new_permission = build(:permission)
    assert_difference('Permission.count') do
      post admin_permissions_url, params: { permission: @new_permission.as_json }
    end

    assert_redirected_to admin_permissions_url
  end

  test 'should show permission' do
    get admin_permission_url(@permission)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_permission_url(@permission)
    assert_response :success
  end

  test 'should update permission' do
    patch admin_permission_url(@permission), params: { permission: @permission.as_json }
    assert_redirected_to admin_permissions_url
  end

  test 'should destroy permission' do
    assert_difference('Permission.count', -1) do
      delete admin_permission_url(@permission)
    end

    assert_redirected_to admin_permissions_url
  end
end
