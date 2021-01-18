# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @role = create(:role)
  end

  test 'should get index' do
    get admin_roles_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_role_url
    assert_response :success
  end

  test 'should create role' do
    @new_role = build(:role)
    assert_difference('Role.count') do
      post admin_roles_url, params: { role: @new_role.as_json }
    end

    assert_redirected_to admin_roles_url
  end

  test 'should show role' do
    get admin_role_url(@role)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_role_url(@role)
    assert_response :success
  end

  test 'should update role' do
    @new_role = build(:role)
    patch admin_role_url(@role), params: { role: @new_role.as_json }
    assert_redirected_to admin_roles_url
  end

  test 'should destroy role' do
    assert_difference('Role.count', -1) do
      delete admin_role_url(@role)
    end

    assert_redirected_to admin_roles_url
  end
end
