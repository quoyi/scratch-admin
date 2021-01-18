# frozen_string_literal: true

require_relative '../../application_system_test_case'

class Admin::OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = create(:organization)
  end

  test 'visiting the index' do
    visit organizations_url
    assert_selector 'h1', text: 'Organizations'
  end

  test 'creating a Organization' do
    visit organizations_url
    click_on 'New Organization'

    fill_in 'Code', with: @organization.code
    fill_in 'Contacts', with: @organization.contacts
    fill_in 'Desc', with: @organization.desc
    fill_in 'Intro', with: @organization.intro
    fill_in 'Mobile', with: @organization.mobile
    fill_in 'Name', with: @organization.name
    fill_in 'Status', with: @organization.status
    fill_in 'Superior', with: @organization.superior_id
    click_on 'Create Organization'

    assert_text 'Organization was successfully created'
    click_on 'Back'
  end

  test 'updating a Organization' do
    visit organizations_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @organization.code
    fill_in 'Contacts', with: @organization.contacts
    fill_in 'Desc', with: @organization.desc
    fill_in 'Intro', with: @organization.intro
    fill_in 'Mobile', with: @organization.mobile
    fill_in 'Name', with: @organization.name
    fill_in 'Status', with: @organization.status
    fill_in 'Superior', with: @organization.superior_id
    click_on 'Update Organization'

    assert_text 'Organization was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Organization' do
    visit organizations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Organization was successfully destroyed'
  end
end
