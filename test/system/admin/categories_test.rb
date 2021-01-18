# frozen_string_literal: true

require_relative '../../application_system_test_case'

class Admin::CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = create(:categorie)
  end

  test 'visiting the index' do
    visit categories_url
    assert_selector 'h1', text: 'Categories'
  end

  test 'creating a Category' do
    visit categories_url
    click_on 'New Category'

    fill_in 'Classifiable', with: @category.classifiable_id
    fill_in 'Classifiable type', with: @category.classifiable_type
    fill_in 'Code', with: @category.code
    fill_in 'Name', with: @category.name
    fill_in 'Status', with: @category.status
    fill_in 'Desc', with: @category.desc
    fill_in 'Superior', with: @category.superior_id
    click_on 'Create Category'

    assert_text 'Category was successfully created'
    click_on 'Back'
  end

  test 'updating a Category' do
    visit categories_url
    click_on 'Edit', match: :first

    fill_in 'Classifiable', with: @category.classifiable_id
    fill_in 'Classifiable type', with: @category.classifiable_type
    fill_in 'Code', with: @category.code
    fill_in 'Name', with: @category.name
    fill_in 'Status', with: @category.status
    fill_in 'Desc', with: @category.desc
    fill_in 'Superior', with: @category.superior_id
    click_on 'Update Category'

    assert_text 'Category was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Category' do
    visit categories_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Category was successfully destroyed'
  end
end
