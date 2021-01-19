# frozen_string_literal: true

require_relative '../../application_system_test_case'

class Admin::MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = create(:material)
  end

  test 'visiting the index' do
    visit admin_materials_url
    assert_selector 'h1', text: 'Materials'
  end

  test 'creating a Material' do
    visit admin_materials_url
    click_on 'New Material'

    fill_in 'Category', with: @material.category_id
    fill_in 'Code', with: @material.code
    fill_in 'Info', with: @material.info
    fill_in 'Name', with: @material.name
    fill_in 'Status', with: @material.status
    fill_in 'Mold', with: @material.mold
    fill_in 'Uploader', with: @material.uploader_id
    fill_in 'Used', with: @material.used
    click_on 'Create Material'

    assert_text 'Material was successfully created'
    click_on 'Back'
  end

  test 'updating a Material' do
    visit admin_materials_url
    click_on 'Edit', match: :first

    fill_in 'Category', with: @material.category_id
    fill_in 'Code', with: @material.code
    fill_in 'Info', with: @material.info
    fill_in 'Name', with: @material.name
    fill_in 'Status', with: @material.status
    fill_in 'Mold', with: @material.mold
    fill_in 'Uploader', with: @material.uploader_id
    fill_in 'Used', with: @material.used
    click_on 'Update Material'

    assert_text 'Material was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Material' do
    visit admin_materials_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Material was successfully destroyed'
  end
end
