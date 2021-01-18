# frozen_string_literal: true

require_relative '../../application_system_test_case'

class Admin::PermissionsTest < ApplicationSystemTestCase
  setup do
    @permission = create(:permission)
  end

  test 'visiting the index' do
    visit permissions_url
    assert_selector 'h1', text: 'Permissions'
  end

  test 'creating a Permission' do
    visit permissions_url
    click_on 'New Permission'

    fill_in 'Action', with: @permission.action
    fill_in 'Code', with: @permission.code
    fill_in 'Controller', with: @permission.controller
    fill_in 'Desc', with: @permission.desc
    fill_in 'Intro', with: @permission.intro
    fill_in 'Name', with: @permission.name
    fill_in 'Namespace', with: @permission.namespace
    fill_in 'Status', with: @permission.status
    click_on 'Create Permission'

    assert_text 'Permission was successfully created'
    click_on 'Back'
  end

  test 'updating a Permission' do
    visit permissions_url
    click_on 'Edit', match: :first

    fill_in 'Action', with: @permission.action
    fill_in 'Code', with: @permission.code
    fill_in 'Controller', with: @permission.controller
    fill_in 'Desc', with: @permission.desc
    fill_in 'Intro', with: @permission.intro
    fill_in 'Name', with: @permission.name
    fill_in 'Namespace', with: @permission.namespace
    fill_in 'Status', with: @permission.status
    click_on 'Update Permission'

    assert_text 'Permission was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Permission' do
    visit permissions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Permission was successfully destroyed'
  end
end
