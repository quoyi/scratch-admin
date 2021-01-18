# frozen_string_literal: true

require_relative '../../application_system_test_case'

class Admin::UsersTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'creating a User' do
    visit users_url
    click_on 'New User'

    @new_user = build(:user)
    fill_in 'user_email', with: @new_user.email
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on '新增用户'

    # assert_text 'User was successfully created'
    assert_text I18n.t('devise.registrations.signed_up')
    # click_on 'Back'
  end

  test 'updating a User' do
    visit users_url
    click_on 'Edit', match: :first

    fill_in 'user_password', with: '123abc..'
    fill_in 'user_password_confirmation', with: '123abc..'
    click_on '更新用户'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User was successfully destroyed'
  end
end
