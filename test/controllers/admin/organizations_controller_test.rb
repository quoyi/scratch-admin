# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test 'should get index' do
    get organizations_url
    assert_response :success
  end

  test 'should get new' do
    get new_organization_url
    assert_response :success
  end

  test 'should create organization' do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: @organization.as_json }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test 'should show organization' do
    get organization_url(@organization)
    assert_response :success
  end

  test 'should get edit' do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test 'should update organization' do
    patch organization_url(@organization), params: { organization: @organization.as_json }
    assert_redirected_to organization_url(@organization)
  end

  test 'should destroy organization' do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
