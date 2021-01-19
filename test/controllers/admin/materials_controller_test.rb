# frozen_string_literal: true

require_relative '../../test_helper'

class Admin::MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_admin

    @material = create(:material)
  end

  test 'should get index' do
    get admin_materials_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_material_url
    assert_response :success
  end

  test 'should create material' do
    @new_material = build(:material)
    assert_difference('Material.count') do
      post admin_materials_url, params: { material: @new_material.as_json }
    end

    assert_redirected_to admin_materials_url
  end

  test 'should show material' do
    get admin_material_url(@material)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_material_url(@material)
    assert_response :success
  end

  test 'should update material' do
    patch admin_material_url(@material), params: { material: @material.as_json }
    assert_redirected_to admin_materials_url
  end

  test 'should destroy material' do
    assert_difference('Material.count', -1) do
      delete admin_material_url(@material)
    end

    assert_redirected_to admin_materials_url
  end
end
