# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @organization = create(:organization)
  end

  test 'should get index' do
    get admin_organizations_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_organization_url
    assert_response :success
  end

  test 'should create organization' do
    @new_organization = build(:organization)
    assert_difference('Organization.count') do
      post admin_organizations_url, params: { organization: @new_organization.as_json }
    end

    assert_redirected_to admin_organizations_url
  end

  test 'should show organization' do
    get admin_organization_url(@organization)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_organization_url(@organization)
    assert_response :success
  end

  test 'should update organization' do
    patch admin_organization_url(@organization), params: { organization: @organization.as_json }
    assert_redirected_to admin_organizations_url
  end

  test 'should destroy organization' do
    assert_difference('Organization.count', -1) do
      delete admin_organization_url(@organization)
    end

    assert_redirected_to admin_organizations_url
  end
end
