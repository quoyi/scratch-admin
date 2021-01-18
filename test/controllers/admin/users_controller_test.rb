# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @user = create(:user)
  end

  test 'should get index' do
    get admin_users_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_user_url
    assert_response :success
  end

  test 'should create user' do
    @new_user = build(:user)
    assert_difference('User.count') do
      post admin_users_url, params: { user: @new_user.as_json }
    end

    assert_redirected_to admin_users_url
  end

  test 'should show user' do
    get admin_user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch admin_user_url(@user), params: { user: @user.as_json }
    assert_redirected_to admin_users_url
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end
end
